class AddSuggestedByToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :suggested_by, :string
  end
end
