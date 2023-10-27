require "rails_helper"

RSpec.describe BookSuggestion, type: :model do
  describe "validations" do
    it "is valid with a title" do
      book_suggestion = BookSuggestion.new(title: "Sample Book Suggestion")
      expect(book_suggestion).to be_valid
    end

    it "is invalid without a title" do
      book_suggestion = BookSuggestion.new(title: nil)
      expect(book_suggestion).not_to be_valid
      expect(book_suggestion.errors[:title]).to include("cannot be blank")
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = User.create(email: "test@example.com", password: "password")
      book_suggestion = BookSuggestion.new(title: "Sample Book Suggestion", user: user)
      expect(book_suggestion.user).to eq(user)
    end
  end

  describe "attributes" do
    it "has a pending_approval attribute" do
      book_suggestion = BookSuggestion.new
      book_suggestion.pending_approval = true
      expect(book_suggestion.pending_approval).to be_truthy
    end
  end
end
