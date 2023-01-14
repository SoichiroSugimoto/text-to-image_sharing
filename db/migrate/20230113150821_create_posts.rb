class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :text, null: false
      t.string :image, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :posts, [:email, :text, :user_id], unique: true
  end
end
