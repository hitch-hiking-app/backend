class HostsController < ApplicationController
  before_action :authenticate!, except: [:index, :show, :departing_search, :destination_search, :suggested_price, :estimated_price]

  def index
    @hosts = Host.all
    render "index.json.jbuilder", status: :ok
  end

  def create
    @host = current_user.hosts.new(departing_city: params[:departing_city],
                                   destination: params[:destination], seats_available: params[:seats_available],
                                   seat_price: params[:seat_price], date_leave: params[:date_leave],
                                   date_arrive: params[:date_arrive], comments: params[:comments],
                                   depart_latitude: params[:depart_latitude],
                                   depart_longitude: params[:depart_longitude],
                                   destination_latitude: params[:destination_latitude],
                                   destination_longitude: params[:destination_longitude])
    if @host.save
      mail = HostTrip.trip(current_user, @host)
      mail.deliver_now
       render "create.json.jbuilder", status: :created
    else
      render json: { errors: @host.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @host = Host.find(params["id"])
    render json: { hosts: @host.as_json }
  end


  def update
    @host = Host.find_by(id: params[:id])
    if current_user.id == @host.user_id
      if @host.update(host_params)
        render "update.json.jbuilder", status: :ok
      else
        render json: { error: "Unable to update trip." }
      end
    else
      render json: { errors: @host.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add
    @host = Host.find_by(id: params[:id])
    @rider = @host.seats.all
    @seats = @rider.map { |rider| rider.user_id }
    @seats.push(@host.user_id)

      if @seats.include?(current_user.id) || @host.seats_left.zero?
        render json: { error: "Sorry, you cannot join this trip." }, status: :forbidden
      else
        @passenger = @host.seats.new(user_id: current_user.id)
        if @passenger.save
          mail = HostJoin.join(current_user, @host)
          mail.deliver_now
          @host.update(seats_left: @host.seats_available - @host.riders.count)
          render "add.json.jbuilder", status: :ok
        else
          render json: { error: @passenger.errors.full_messages }, status: :conflict
        end
      end
  end

  def destroy
    @host = Host.find_by(id: params[:id])
    if current_user.id == @host.user_id
      @host.destroy
      render json: { message: "Trip deleted." },
      status: :accepted
    else
      render json: { error: "Invalid User."},
      status: :unauthorized
    end
  end

  def departing_search
    @locations = Host.near([params[:depart_latitude],
                            params[:depart_longitude]],
                             params[:radius],
                             latitude: :depart_latitude,
                             longitude: :depart_longitude)

    render "departing_search.json.jbuilder"
  end

  def destination_search
    @locations = Host.near([params[:destination_latitude],
                            params[:destination_longitude]],
                            params[:radius])
    render "destination_search.json.jbuilder"
  end

  def suggested_price
    result_a = []
    result_b = []
    mpg = 25 #national average miles per gallon
    @trip = Host.find_by(id: params[:id])
    @distance = Geocoder::Calculations.distance_between([@trip.depart_latitude, @trip.depart_longitude],
                                                [@trip.destination_latitude, @trip.destination_longitude])
    @gas_feed = Mygasfeed.new
    @depart = @gas_feed.get_gas(@trip.depart_latitude, @trip.depart_longitude)
    @dest = @gas_feed.get_gas(@trip.destination_latitude, @trip.destination_longitude)
    @depart.each {|x| result_a.push(x)}
    @dest.each {|x| result_b.push(x)}
    @start_city = result_a[2][1][0]
    @end_city = result_b[2][1][0]
    gas_a = @start_city.fetch("mid_price")
    gas_b = @end_city.fetch("mid_price")
    gas_product = (gas_a.to_f * gas_b.to_f) -3
    gas_average = gas_product/2
    @total_price = (@distance / mpg) * gas_average
    render :json => { :total_price => @total_price }
  end

  def estimated_price
    result_a = []
    result_b = []
    mpg = 25 #national average miles per gallon
    @depart_lat = params[:depart_latitude]
    @depart_long = params[:depart_longitude]
    @dest_lat = params[:destination_latitude] 
    @dest_long = params[:destination_longitude]
    @distance = Geocoder::Calculations.distance_between([params[:depart_latitude], params[:depart_longitude]], 
                                                [params[:destination_latitude], params[:destination_longitude]])
    @gas_feed = Mygasfeed.new
    @depart = @gas_feed.get_gas(@depart_lat, @depart_long)
    @dest = @gas_feed.get_gas(@dest_lat, @dest_long)
    @depart.each {|x| result_a.push(x)}
    @dest.each {|x| result_b.push(x)}
    @start_city = result_a[2][1][0]
    @end_city = result_b[2][1][0]
    gas_a = @start_city.fetch("mid_price")
    gas_b = @end_city.fetch("mid_price")
    gas_product = (gas_a.to_f * gas_b.to_f) -3
    gas_average = gas_product/2
    @total_price = (@distance / mpg) * gas_average
    render :json => { :total_price => @total_price }
  end
  
private

  def host_params
    params.permit :departing_city, :destination, :seats_available,
                  :seat_price, :date_leave, :date_arrive, :comments
  end

  # def user_params
  #   params.permit :credit_card_number, :name_on_card,
  #                 :expiration_date, :security_code
  # end


end
