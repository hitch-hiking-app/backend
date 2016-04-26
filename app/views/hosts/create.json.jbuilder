json.host do
  json.user_name @host.user.user_name
  json.extract! @host, :departing_city, :destination,
                       :seats_available, :seat_price,
                       :date_leave, :date_arrive,
                       :comments
end
