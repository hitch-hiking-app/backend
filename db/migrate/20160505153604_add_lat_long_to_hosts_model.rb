class AddLatLongToHostsModel < ActiveRecord::Migration
  def change
    add_column(:hosts, :depart_latitude, :float)
    add_column(:hosts, :depart_longitude, :float)
  end
end
