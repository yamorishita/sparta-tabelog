class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name,   null: false
      t.string :tel,    length: { minimum: 10, maximum: 13 }
      t.string :address
      t.string :url

      t.timestamps null: false
    end
    add_index :restaurants, :name
  end
end
