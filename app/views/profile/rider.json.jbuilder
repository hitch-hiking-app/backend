json.user do
  json.id @user.id
  json.user_name @user.user_name
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.rider @riders do |rider|
    json.seat rider#.id
    # json.seat rider.host_id
    # json.user @user do |user|
    #   json.host_id user.host.id
  	# 	json.driver user.host.user_id
  	# 	json.departing_city user.host.departing_city
 	  #   json.destination user.host.destination
  	# 	json.seats_available user.host.seats_available
  	# 	json.seat_price user.host.seat_price
		#   json.date_leave user.host.date_leave
	  # 	json.date_arrive user.host.date_arrive
  	# 	json.comments user.host.comments
	  # end
  end
end



# json.host @hosts do |host|
#   json.id host.id
#   json.user do
#     json.first_name host.user.first_name
#     json.last_name host.user.last_name
#     json.picture host.user.pictures.first.image
#   end
#   json.departing_city host.departing_city
#   json.destination host.destination
#   json.seats_available host.seats_available
#   json.seat_price host.seat_price
#   json.date_leave host.date_leave
#   json.date_arrive host.date_arrive
#   json.comments host.comments
# end
