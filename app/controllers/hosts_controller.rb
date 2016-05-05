class HostsController < ApplicationController
  before_action :authenticate!, except: [:index, :show]

  def index
    @hosts = Host.all
    render "index.json.jbuilder", status: :ok
  end

  def create
    @host = current_user.hosts.new(departing_city: params[:departing_city],
                                   destination: params[:destination], seats_available: params[:seats_available],
                                   seat_price: params[:seat_price], date_leave: params[:date_leave],
                                   date_arrive: params[:date_arrive], comments: params[:comments])
    if @host.save
       # send email here
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

  # def add
  #   @host = Host.find_by(id: params[:id])
  #   @seat = @host.seats.new(user_id: current_user.id)
  #   if @seat.save
      # @host.update(seats_available: params[:seats_available])
  #   else
  #      render json: { error: @seat.errors.full_messages }, status: :conflict
  #    end
  # end

  def add
    @host = Host.find_by(id: params[:id])
    @rider = @host.seats.all
    @seats = @rider.map {|rider| rider.user_id}
    @seats.push(@host.user_id)
      unless @seats.include?(current_user.id)
        @passenger = @host.seats.new(user_id: current_user.id)
        if @passenger.save
          @host.update(add_params)
          render "add.json.jbuilder", status: :ok
        else
          render json: { error: @passenger.errors.full_messages }, status: :conflict
        end
      else
        render json: { error: "You already joined this trip!" }
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

private

  def host_params
    params.permit :departing_city, :destination, :seats_available,
                  :seat_price, :date_leave, :date_arrive, :comments
  end

  def user_params
    params.permit :credit_card_number, :name_on_card,
                  :expiration_date, :security_code
  end

  def add_params
    params.permit :seats_available
  end

end
