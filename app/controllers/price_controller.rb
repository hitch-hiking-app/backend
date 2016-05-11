class PriceController < ApplicationController

  def collect_stations(latitude, longitude)
    result = []
    @gas_feed = Mygasfeed.new
    @stations = @gas_feed.get_gas(latitude, longitude)
    @stations.each { |station| result.push(station) }
    gas_station = result[2][1][0]
    gas_price = gas_station.fetch("reg_price")
    end

  def calculate_distance(depart_lat, depart_long, dest_lat, dest_long)
    @distance = Geocoder::Calculations.distance_between([depart_lat, depart_long], 
                                                        [dest_lat, dest_long])
  end

  def estimate_price(distance, depart_gas, dest_gas)
    mpg = 25 #national average miles per gallon
    gas_product = (depart_gas.to_f * dest_gas.to_f) -1.5 #Mygasfeed API is out of date and give prices from over one year ago.
                                                          #Subtraction is to make prices more relevant.
    gas_average = gas_product/2
    total_price = (distance / mpg) * gas_average
  end

  def new_trip
    @depart_lat = params[:depart_latitude]
    @depart_long = params[:depart_longitude]
    @dest_lat = params[:destination_latitude] 
    @dest_long = params[:destination_longitude]
    @distance = calculate_distance(@depart_lat, @depart_long, @dest_lat, @dest_long)
    @depart_gas = collect_stations(@depart_lat, @depart_long)
    @dest_gas = collect_stations(@dest_lat, @dest_long)
    total_price = estimate_price(@distance, @depart_gas, @dest_gas)
      render :json => { :total_price => total_price }
  end

  def hosted_trip
    @trip = Host.find_by(id: params[:id])
    @distance = calculate_distance(@trip.depart_latitude, @trip.depart_longitude, 
                                   @trip.destination_latitude, @trip.destination_longitude)
    @depart_gas = collect_stations(@trip.depart_latitude, @trip.depart_longitude)
    @dest_gas = collect_stations(@trip.destination_latitude, @trip.destination_longitude)
    total_price = estimate_price(@distance, @depart_gas, @dest_gas)
      render :json => { :total_price => total_price }
  end
end