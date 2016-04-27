UsersController < ApplicationController
before_action :authenticate!

def update
  @user = User.find_by(id: params[:id])
  if current_user.id == @user.id
    @user.update(first_name: params[:first_name],
    last_name: params[:last_name], phone: params[:phone],
    car_info: params[:car_info], home_city: params[:home_city],
    license_plate: params[:license_plate], license_number: params[:license_number],
    credit_card_number: params[:credit_card_number], driver: true])
       render "update.json.jbuilder", status: :created
  else
    render json: { errors: @host.errors.full_messages }, status: :unprocessable_entity
  end
end
end
