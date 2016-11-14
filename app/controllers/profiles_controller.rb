class ProfilesController < ApplicationController
  before_action :set_profile, only:[:show, :edit, :update, :payment]

  def index
    if params[:search]
      @profiles = Profile.search(params[:search][:query])
    else
      @profiles = Profile.all
    end  
  end

  def new
    redirect_to profiles_path if current_user.profile
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
    else
      render 'new'
    end
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
      params.require(:profile).permit(:account_name, :about, :picture)
    end
end
