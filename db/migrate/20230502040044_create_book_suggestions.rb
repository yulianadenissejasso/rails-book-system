class CreateBookSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :book_suggestions do |t|
      t.string :title
      t.text :description
      t.boolean :pending_approval
      t.string :suggested_by

      t.timestamps
    end
  end
end
