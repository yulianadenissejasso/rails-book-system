require "rails_helper"

RSpec.describe Book, type: :model do
  describe "validations" do
    it "is valid with a title" do
      book = Book.new(title: "Sample Book")
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(title: nil)
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end
  end

  describe "recommendations" do
    it "returns recommended books" do
      recommended_book = Book.create(title: "Recommended Book", recommended: true)
      non_recommended_book = Book.create(title: "Non-recommended Book", recommended: false)

      recommended_books = Book.recommended

      expect(recommended_books).to include(recommended_book)
      expect(recommended_books).not_to include(non_recommended_book)
    end
  end
end
