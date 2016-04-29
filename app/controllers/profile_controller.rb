class ProfileController < ApplicationController
	before_action :authenticate!, only: [:update]

	def show
		@user = User.find_by(id: params[:id])
		@host = @user.hosts.all
		@picture = @user.pictures
		render "show.json.jbuilder", status: :ok
	end

  	def update
    	@user = User.find_by(id: params[:id])
    	@user.update(user_params)
		@picture = @user.pictures.first
      	@user_image = @picture.update_attribute(:image, params[:image])
      	if @user.save
        	render "update.json.jbuilder", status: :created
   		else
      		render json: { errors: @user.errors.full_messages }, 
      		status: :unprocessable_entity
    	end
  	end

  	def user_params
		params.permit :user_name, :first_name, :last_name, 
					  :password, :email, :phone, :car_info,
					  :home_city, :license_number, :license_plate,
					  :credit_card_number
	end
end
