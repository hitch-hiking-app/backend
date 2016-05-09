class MyGasFeed
	include HTTparty
	base_uri "http://api.mygasfeed.com/"
	format :json

	def initialize
		@headers = {
			"Authorization" => ENV[MYGASFEED_ID],
			"User-Agent" => "HTTParty"
		}
		@default = {
			"distance" => 5,
			"fuel type" => reg,
			"sort_by" => distance
		}
	end

	def departing_gas(lat, long)

	options = {
		"latitude" => @departing_lat
		"longitude" => @depart_long
	}
	params = options.merge(@defaults)
	
	query = MyGasFeed.get("/stations/radius/", query: params, headers: @headers)
	end 

	def destination_gas

	end

	def suggested_
end