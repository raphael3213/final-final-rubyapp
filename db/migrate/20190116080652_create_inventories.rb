class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item_type
      t.string :sku
      t.string :Title
      t.string :serial_number
      t.integer :quantity
      t.integer :price
      t.string :organization
      t.integer :Length
      t.integer :Breadth
      t.integer :Height
      t.integer :Weight
      t.text :description
      t.text :short_description
      t.string :asset_code
      t.string :grade
      t.string :category
      t.string :brand

      t.timestamps null: false
    end
  end
end
