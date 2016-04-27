class ProfileController < ApplicationController
	before_action :authenticate!

	def show
		@user = User.find_by(id: params[:id])
		@host = current_user.hosts.all
		@picture = current_user.pictures.where(imageable_id: params[:imageable_id],
												imageable_type: params[:imageable_type])
		render "show.json.jbuilder", status: :ok
	end
end