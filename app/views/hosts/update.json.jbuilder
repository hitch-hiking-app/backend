json.host do
  json.user_name @host.user.user_name
  json.first_name @host.user.first_name
  json.last_name @host.user.last_name
  json.email @host.user.email
  json.driver @host.user.driver
  json.extract! @host, :user_id, :id, :departing_city,
                       :destination, :seats_available,
                       :seat_price, :date_leave,
                       :date_arrive, :comments
  #json.credit_card_number @user.credit_card_number
  #json.name_on_card @user.name_on_card
  #json.expiration_date @user.security_code
end
