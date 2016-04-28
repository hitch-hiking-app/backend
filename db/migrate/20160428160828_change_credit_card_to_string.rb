class ChangeCreditCardToString < ActiveRecord::Migration
  def change
  	remove_column :users, :credit_card_number, :integer
  	add_column :users, :credit_card_number, :string
  end
end
