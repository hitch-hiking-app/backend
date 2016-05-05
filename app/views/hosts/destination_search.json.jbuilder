json.search @location do |location|
	 json.id location.id
	 json.departing_city location.departing_city
  json.destination location.destination
  json.seats_available location.seats_available
  json.seat_price location.seat_price
  json.date_leave location.date_leave
  json.date_arrive location.date_arrive
  json.comments location.comments
  json.user do
    json.first_name location.user.first_name
    json.last_name location.user.last_name
    binding.pry
    json.picture location.user.pictures.image
  end
  end
