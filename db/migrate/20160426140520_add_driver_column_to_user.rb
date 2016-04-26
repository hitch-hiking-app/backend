class AddDriverColumnToUser < ActiveRecord::Migration
  def change
  	add_column :user, :driver, :boolean, default: false
  end
end
