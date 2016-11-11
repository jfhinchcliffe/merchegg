class ProfilesController < ApplicationController
  before_action :set_profile, only:[:show, :edit, :update]

  def index
    @profiles = Profile.all
  end  

  def edit
    if current_user != @profile.user
      redirect_to profiles_path
    end
  end

  def show

  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end  

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:account_name, :about)
    end
end
