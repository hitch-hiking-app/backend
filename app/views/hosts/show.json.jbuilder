json.hosts do
  json.user_name @host.user.user_name
  json.first_name @host.user.first_name
  json.last_name @host.user.last_name
  json.email @host.user.email
  json.driver @host.user.driver
  json.extract! @host, :user_id, :id, :departing_city,
                       :destination, :seats_available,
                       :seat_price, :date_leave,
                       :date_arrive, :comments,
                       :depart_latitude, :depart_longitude,
                       :destination_latitude, :destination_longitude
end
json.riders @host.riders do |rider|
  json.extract! rider, :id, :user_name,
  					   :first_name, :last_name, 
  					   :email, :auth_token, 
  					   :driver, :phone,
  					   :car_info, :home_city,
  					   :license_plate, :license_number, :credit_card_number
  json.pictures rider.pictures.map {|x| x.image.url }
end


