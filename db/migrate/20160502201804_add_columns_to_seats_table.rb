class AddColumnsToSeatsTable < ActiveRecord::Migration
  def change
    add_column(:seats, :user_id, :integer)
    add_column(:seats, :host_id, :integer)
  end
end
