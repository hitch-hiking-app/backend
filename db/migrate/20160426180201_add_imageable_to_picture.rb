class AddImageableToPicture < ActiveRecord::Migration
  def change
  	add_column :pictures, :imageable_id, :integer
  	add_column :pictures, :imageable_type, :string
  	add_index :pictures, :imageable_id
  end
end
