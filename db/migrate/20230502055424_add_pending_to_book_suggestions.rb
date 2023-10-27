class AddPendingToBookSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :book_suggestions, :pending, :boolean
  end
end
