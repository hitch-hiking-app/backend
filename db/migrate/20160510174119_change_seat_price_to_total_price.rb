class ChangeSeatPriceToTotalPrice < ActiveRecord::Migration
  def change
  	rename_column :hosts, :seat_price, :total_price
  end
end
