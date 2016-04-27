class ProfileController < ApplicationController
	before_action :authenticate!, except: [:show]
	def show
		@user = User.find_by(id: params[:id])
		@host = current_user.hosts.all
		@picture = current_user.pictures
		render "show.json.jbuilder", status: :ok
	end
end