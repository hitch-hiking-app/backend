class AddDatesToHostsModel < ActiveRecord::Migration
  def change
  	remove_column(:hosts, :date, :date)
    add_column(:hosts, :date_leave, :date)
    add_column(:hosts, :date_arrive, :date)
  end
end
