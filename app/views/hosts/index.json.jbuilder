json.host @hosts do |host|
  json.id host.id
  json.user_id host.user_id
  json.departing_city host.departing_city
  json.destination host.destination
  json.seats_available host.seats_available
  json.seat_price host.seat_price
  json.date_leave host.date_leave
  json.date_arrive host.date_arrive
  json.comments host.comments
end
