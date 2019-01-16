class AddVolumeToInventories < ActiveRecord::Migration
  def change
  	add_column :inventories, :Volume, :integer
  end
end
