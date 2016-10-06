class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      add_index :comments, [:user_id, :post_id]
      add_index :comments, :post_id
      t.integer :post_id
      t.integer :user_id
      t.text :text
      t.timestamps null: false
    end
  end
end
