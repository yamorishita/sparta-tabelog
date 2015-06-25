class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.float :rate, null: false, default: 1, scale: 1

      t.timestamps null: false
    end
    add_index :reviews, [:user_id, :restaurant_id], unique: true
  end
end
