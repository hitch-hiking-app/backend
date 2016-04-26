class AddDriverColumnToUser < ActiveRecord::Migration
  def change
  	remove_column(:users, :driver, :boolean)
  	add_column(:users, :driver, :boolean, :default => false)
  end
end
