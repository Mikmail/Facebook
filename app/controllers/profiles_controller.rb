class ProfilesController < ApplicationController

  def new 
    @profile = Profile.new 
  end 
  
  def create 
    @profile = current_user.build_profile(profile_params)

    if @profile.save 
      redirect_to user_path(current_user)
    else 
      render :new 
    end 
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end 

  def update 
    @profie = Profile.find_by(user_id: current_user.id)

    if @profile.update(profile_params)
      redirect_to user_path(current_user)
    else 
      render :edit 
    end 
  end

  private 

  def profile_params 
    params.require(:profile).permit(:name, :gender, :age, :location)
  end

end
