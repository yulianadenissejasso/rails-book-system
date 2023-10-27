class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.boolean :read
      t.boolean :pending

      t.timestamps
    end
  end
end
