class AddPictureIdToUserAndUserIdToPicture < ActiveRecord::Migration
  def change
  	add_column :pictures, :user_id, :integer
  	add_column :users, :picture_id, :integer
  end
end
