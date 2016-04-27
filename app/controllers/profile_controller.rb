class ProfileController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
		@host = @user.hosts.all
		@picture = @user.pictures
		render "show.json.jbuilder", status: :ok
	end
end