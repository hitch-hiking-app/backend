json.host @hosts do |host|
  json.id host.id
  json.user do
    json.first_name host.user.first_name
    json.last_name host.user.last_name
    json.picture host.user.pictures.first.image
  end
  json.departing_city host.departing_city
  json.destination host.destination
  json.seats_available host.seats_available
  json.seat_price host.seat_price
  json.date_leave host.date_leave
  json.date_arrive host.date_arrive
  json.comments host.comments
end
