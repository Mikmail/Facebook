class HomeController < ApplicationController
  before_action :require_login 

  def index
  end
  
  private 

  def require_login
    unless current_user 
      redirect_to new_user_registration_path
    end
  end
  
end
