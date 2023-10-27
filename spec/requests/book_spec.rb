require 'rails_helper'

RSpec.describe "Requests", type: :request do
  describe "GET /books" do
    it "returns a successful response" do
      get "/books"
      expect(response).to be_successful
    end
  end

  describe "GET /books/unread" do
    it "returns a successful response" do
      get "/books/unread"
      expect(response).to be_successful
    end
  end

  describe "GET /books/read" do
    it "returns a successful response" do
      get "/books/read"
      expect(response).to be_successful
    end
  end

  describe "PATCH /book_suggestions/:id/approve" do
    let(:book_suggestion) { create(:book_suggestion) }

    it "returns a successful response" do
      patch "/book_suggestions/#{book_suggestion.id}/approve"
      expect(response).to be_successful
    end
  end

  describe "DELETE /book_suggestions/:id/reject" do
    let(:book_suggestion) { create(:book_suggestion) }

    it "returns a successful response" do
      delete "/book_suggestions/#{book_suggestion.id}/reject"
      expect(response).to be_successful
    end
  end

  describe "POST /book_suggestions/:id/add_to_library" do
    let(:book_suggestion) { create(:book_suggestion) }

    it "returns a successful response" do
      post "/book_suggestions/#{book_suggestion.id}/add_to_library"
      expect(response).to be_successful
    end
  end

  describe "GET /" do
    it "returns a successful response" do
      get "/"
      expect(response).to be_successful
    end
  end

    #Sad Paths
    context "When not signed in" do
      it "should not GET /index" do
        get grades_url
        expect(response).to redirect_to(new_user_session_path)
      end
end
end
