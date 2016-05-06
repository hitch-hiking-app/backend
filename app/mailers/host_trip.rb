class HostTrip < ApplicationMailer
  default :from => 'no-reply@lifteri.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def trip(user, host)
    @user = user
    @host = host
    mail( to: @user.email,
    subject: "Trip Itinerary" )
  end

end
