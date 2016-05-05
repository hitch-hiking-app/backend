class RemoveSeatsLeftFromHosts < ActiveRecord::Migration
  def change
    remove_column(:hosts, :seats_left, :integer)
  end
end
