class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.integer :user_id
      t.string :departing_city
      t.string :destination
      t.date :date
      t.integer :seats_available
      t.integer :seat_price

      t.timestamps null: false
    end
  end
end
