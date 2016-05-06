class ProfileDelete < ApplicationMailer
  default :from => 'no-reply@lifteri.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def delete(user)
    @user = user
    mail( to: @user.email,
    subject: "Profile deleted successfully." )
  end

end
