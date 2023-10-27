class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /books or /books.json
  def index
    @books = Book.all
  end

  def recommendations
    @recommended_books = Book.recommended 
  end
  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    if current_user.admin?
    @book = Book.new
    else
      redirect_to root_path, notice: "You do not have the capability of adding a new book."
  end
end
  # GET /books/1/edit
  def edit
    if current_user.admin?
  
      else
        redirect_to root_path, notice: "You do not have the capability of editing a book."
    end
  end

  # POST /books or /books.json
  def create
    if current_user.admin?
      @book = Book.new(book_params)
      if @book.save
        redirect_to @book, notice: 'Book was successfully created.'
      else
        render :new
      end
    else
      @book_suggestion = BookSuggestion.new(book_params)
      @book_suggestion.suggested_by = current_user.email
      @book_suggestion.pending_approval = true
      if @book_suggestion.save
        flash[:notice] = "Thank you for your book suggestion! It will be reviewed by an admin before being added to the library."
        redirect_to root_path
      else
        render :new
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /books/1 or /books/1.json
  def destroy

    if current_user.admin?
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  else
    redirect_to root_path, notice: "You do not have the capability of deleting a book."
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find_by(id: params[:id])
  unless @book
    if params[:id] == "read"
      @books = Book.where(read: true)
    elsif params[:id] == "unread"
      @books = Book.where(read: false)
    end
    render :index
  end
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :read, :pending)
    end
end
