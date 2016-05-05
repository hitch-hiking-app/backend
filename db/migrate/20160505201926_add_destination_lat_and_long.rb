class AddDestinationLatAndLong < ActiveRecord::Migration
  def change
  	add_column :hosts, :destination_latitude, :float
  	add_column :hosts, :destination_longitude, :float
  	add_column :hosts, :radius, :integer
  end
end
