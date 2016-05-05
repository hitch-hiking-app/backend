class AddSeatsLeftToHosts < ActiveRecord::Migration
  def change
    add_column(:hosts, :seats_left, :integer, :default => 100)
  end
end
