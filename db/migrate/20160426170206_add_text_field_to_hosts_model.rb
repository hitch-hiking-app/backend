class AddTextFieldToHostsModel < ActiveRecord::Migration
  def change
    add_column(:hosts, :comments, :text)
  end
end
