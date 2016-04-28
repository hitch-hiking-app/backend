class AddCreditInfoToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :name_on_card, :string)
    add_column(:users, :expiration_date, :string)
    add_column(:users, :security_code, :integer)
  end
end
