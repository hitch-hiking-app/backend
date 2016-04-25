class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :phone
      t.string :car_info
      t.string :home_city
      t.boolean :driver

      t.timestamps null: false
    end
  end
end
