# class MyGasFeed
# 	include HTTparty
# 	debug_output $stdout # <= will spit out all request details to the console
# 	base_uri "http://api.mygasfeed.com/"
# 	format :json

# 	def initialize
# 		@headers = {
# 			"Authorization" => ENV[MYGASFEED_ID],
# 			"User-Agent" => "HTTParty"
# 		}
# 		@default = {
# 			"distance" => 5,
# 			"fuel type" => reg,
# 			"sort_by" => distance
# 		}
# 	end

# 	def departing_gas(depart_latitude, depart_longitude)
# 	options = {
# 		"latitude" => depart_latitude,
# 		"longitude" => depart_longitude
# 	}
# 	params = options.merge(@defaults)
	
# 	query = MyGasFeed.get("/stations/radius/", query: params, headers: @headers)
# 	end 

# 	def destination_gas(destination_latitude, destination_longitude)
# 	options = {
# 			"latitude" => destination_latitude,
# 			"longitude" => destination_longitude
# 	}
# 	params = options.merge(@defaults)
# 	query = MyGasFeed.get("/stations/radius/", query: params, headers: @headers)
# 	end
# end