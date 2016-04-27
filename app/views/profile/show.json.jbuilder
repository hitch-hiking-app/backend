json.user do
  json.id @user.id
  json.user_name @user.user_name
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.auth_token @user.auth_token
  json.driver @user.driver


  json.pictures @user.pictures do |picture|
    json.image_url picture.image.url
  end
	  json.host @host do |host|
  		json.host host.user_id
  		json.departing_city host.departing_city
 		json.destination host.destination
  		json.seats_available host.seats_available
  		json.seat_price host.seat_price
		json.date_leave host.date_leave
	  	json.date_arrive host.date_arrive
  		json.comments host.comments
	  end
end



