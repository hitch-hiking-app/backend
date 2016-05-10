class Mygasfeed
	include HTTParty
	#debug_output $stdout # <= will spit out all request details to the console
	base_uri "http://api.mygasfeed.com"
	format :json

	def initialize
		@api_key = ENV["MYGASFEED_API_KEY"]
	end

	def get_gas(latitude, longitude)
	query = Mygasfeed.get("/stations/radius/#{latitude}/#{longitude}/50/reg/distance/#{@api_key}.json")
	end 
end

