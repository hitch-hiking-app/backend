class ProfileController < ApplicationController
	before_action :authenticate!, only: [:update, :destroy]

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
    	Picture.update(@picture.id, pic_params)
    	if @user.save
      	render "update.json.jbuilder", status: :created
 		else
    		render json: { errors: @user.errors.full_messages },
    		status: :unprocessable_entity
  		end
	end


  def destroy
    @profile = User.find_by(id: params[:id])
    if @profile.destroy
      render json: { message: "Profile deleted." },
      status: :accepted
    else
      render json: { error: "Invalid User."},
      status: :unauthorized
    end
  end

	def user_params
	params.permit :user_name, :first_name, :last_name,
				  :password, :email, :phone, :car_info,
				  :home_city, :license_number, :license_plate,
				  :credit_card_number
	end

	def pic_params
		params.permit :image
	end
end
