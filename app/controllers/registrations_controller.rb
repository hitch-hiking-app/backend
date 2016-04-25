class RegistrationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    @user = User.new(user_name: params[:user_name], first_name: params[:first_name],
                     last_name: params[:last_name], email: params[:email],
                     password_digest: params[:password])
   @user.ensure_auth_token
   if @user.save
     render 'create.json.jbuilder', status: :created
   else
     render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
   end
  end
end
