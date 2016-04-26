json.user do
  json.user_name @host.user.user_name
  json.first_name @host.user.first_name
  json.last_name @host.user.last_name
  json.email @host.user.email
  json.extract! @host, :user_id, :departing_city, :destination,
                       :seats_available, :seat_price, :date_leave,
                       :date_arrive, :comments
end
