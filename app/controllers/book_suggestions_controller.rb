class BookSuggestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_admin!, only: [:approve, :reject]

  def index
    @book_suggestions = BookSuggestion.all
  end

  def new
    @book_suggestion = BookSuggestion.new
  end


  def show
    @book_suggestion = BookSuggestion.find(params[:id])
  end
  

  def create
    @book_suggestion = BookSuggestion.new(book_params)
    @book_suggestion.suggested_by = current_user.email
    if @book_suggestion.save
      flash[:notice] = "Thank you for your book suggestion! It will be reviewed by an admin before being added to the library."
      redirect_to root_path
    else
      render :new
    end
  end

  def approve
    @book_suggestion = BookSuggestion.find(params[:id])
    @book_suggestion.update(pending_approval: false)
  
    # Create a new book based on the approved suggestion
    Book.create(title: @book_suggestion.title)
  
    # Delete the approved book suggestion
    @book_suggestion.destroy
  
    redirect_to books_path, notice: 'Book suggestion has been approved and added to the books index.'
  end
  

  def reject
    @book_suggestion = BookSuggestion.find(params[:id])
    @book_suggestion.destroy
    redirect_to book_suggestions_path, notice: 'Book suggestion has been rejected.'
  end

  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: 'Access denied. You must be an admin to perform this action.'
    end
  end
  private

  def book_params
    params.require(:book_suggestion).permit(:title, :description)
  end
end
