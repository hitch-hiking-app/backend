class HostsController < ApplicationController
  before_action :authenticate!, except: [:index]

  def index
    @hosts = Host.all
    render "index.json.jbuilder", status: :ok
  end

  def create
    @host = current_user.hosts.create(departing_city: params[:departing_city],
                          destination: params[:destination], seats_available: params[:seats_available],
                          seat_price: params[:seat_price], date_leave: params[:date_leave],
                          date_arrive: params[:date_arrive], comments: params[:comments])
    if @host.save
       render "create.json.jbuilder", status: :created
    else
      render json: { errors: @host.errors.full_messages }, status: :unprocessable_entity
    end
  end


end


#     logins POST   /logins(.:format)   logins#create
#   register POST   /register(.:format) registrations#create
# host_index GET    /host(.:format)     host#index
#            POST   /host(.:format)     host#create
#       host GET    /host/:id(.:format) host#show
#            PATCH  /host/:id(.:format) host#update
#            PUT    /host/:id(.:format) host#update
#            DELETE /host/:id(.:format) host#destroy

  #  id
  #  user_id
  #  departing_city
  #  destination
  #  seats_available
  #  seat_price
  #  date_leave
  #  date_arrive