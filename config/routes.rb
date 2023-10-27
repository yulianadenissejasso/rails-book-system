Rails.application.routes.draw do
  devise_for :users
  resources :books, :book_suggestions

  root to: 'books#index'

  get '/books', to: 'books#index', as: 'all_books'
  get '/books/unread', to: 'books#unread', as: 'unread_books'
  get '/books/read', to: 'books#read', as: 'read_books'

  patch '/book_suggestions/:id/approve', to: 'book_suggestions#approve', as: 'approve_book_suggestion'
  delete '/book_suggestions/:id/reject', to: 'book_suggestions#reject', as: 'reject_book_suggestion'
  post '/book_suggestions/:id/add_to_library', to: 'books#add_to_library', as: 'add_to_library'

  # Define your application
end