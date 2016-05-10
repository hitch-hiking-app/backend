class RevertTotalPriceBackToSeatPrice < ActiveRecord::Migration
  def change
  	  	rename_column :hosts, :total_price, :seat_price
  end
end
