class AddCarInfoToUser < ActiveRecord::Migration
  def change
    add_column(:users, :license_plate, :string)
    add_column(:users, :license_number, :string)
    add_column(:users, :credit_card_number, :integer)
  end
end
