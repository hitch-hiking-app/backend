class HostsController < ApplicationController
  before_action :authenticate!, except: [:index, :show, :departing_search, :destination_search]

  def index
    @hosts = Host.all
    render "index.json.jbuilder", status: :ok
  end

  def create
    @host = current_user.hosts.new(departing_city: params[:departing_city],
                                   destination: params[:destination], seats_available: params[:seats_available],
                                   seat_price: params[:seat_price], date_leave: params[:date_leave],
                                   date_arrive: params[:date_arrive], comments: params[:comments],
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
                             params[:radius])

    render "departing_search.json.jbuilder"
  end

  def destination_search
    @locations = Host.near([params[:destination_latitude],
                            params[:destination_longitude]],
                            params[:radius])
    render "destination_search.json.jbuilder"
  end

  def suggested_price
    @trip = Host.find_by(id: params[:id])
    #binding.pry
    @gas_feed = Mygasfeed.new
    @depart = @gas_feed.departing_gas(@trip.depart_latitude, @trip.depart_longitude)
    @dest = @gas_feed.destination_gas(@trip.destination_latitude, @trip.destination_longitude)
    @start_city = @depart[stations][0][mid_price]
    @end_city = @depart[stations][0][mid_price]
    starting_city ** end_city
    #binding.pry
    @distance = @depart_location.distance_from(dest_location)
    @gas = 2
    @trip_price = @distance ** @gas
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
