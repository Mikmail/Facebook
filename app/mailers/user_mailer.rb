class UserMailer < ApplicationMailer
  default from: 'mikael@rubynor.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://odin-facebook.rubynor.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to odin-facebook!')
  end
end