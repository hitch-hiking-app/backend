class LoginsController < ApplicationController
before_action :authenticate!, only: [:check_auth]

  def create
    @user = User.find_by!(user_name: params["user_name"])
    if @user.authenticate(params["password"])
      render 'create.json.jbuilder', status: :created
    else
      render json: { message: "Username or password could not be found." },
             status: :unauthorized
    end
  end

  def check_auth
    if current_user
      render json: { message: "Logged in as #{current_user.email}" },
             status: :ok
    else
      render json: { message: "Auth isn't working yet." },
             status: :unauthorized
    end
  end
end
