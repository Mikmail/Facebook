class WelcomeMailer < ApplicationMailer

  def welcome_send(user)
    @user = user
    mail to: user.email, subject: 'Welcome to odin-facebook!', from: 'noreply@odin-facebook.com'
  end
end