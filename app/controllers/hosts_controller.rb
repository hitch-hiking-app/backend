class HostsController < ApplicationController
  before_action :authenticate!, except: [:index, :show, :update]

  def index
    @hosts = Host.all
    render "index.json.jbuilder", status: :ok
  end

  def create
    @host = current_user.hosts.create(user_id: session[:user_id], id: params[:id],
                                      departing_city: params[:departing_city],
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
    @user = current_user
    if @user.id == @host.user_id
      @host.update(host_params)
        # @host.update(departing_city: params[:departing_city],
        # destination: params[:destination], seats_available: params[:seats_available],
        # seat_price: params[:seat_price], date_leave: params[:date_leave],
        # date_arrive: params[:date_arrive], comments: params[:comments])

      #@user.update(user_params)
        # @user.update(credit_card_number: params[:credit_card_number],
        # name_on_card: params[:name_on_card], expiration_date: params[:expiration_date],
        # security_code: params[:security_code])
         render "update.json.jbuilder", status: :ok
    else
      render json: { errors: @host.errors.full_messages }, status: :unprocessable_entity
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

  def host_params
    params.permit :departing_city, :destination, :seats_available,
                  :seat_price, :date_leave, :date_arrive, :comments
  end

  def user_params
    params.permit :credit_card_number, :name_on_card,
                  :expiration_date, :security_code
  end

end
