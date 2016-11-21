class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only:[:show, :edit, :update, :payment, :sms]

  def index
    @boxes = current_user.boxes.all.includes(:codes)
  end

  def new
    if current_user.can_build_box?
      @box = current_user.boxes.build
    else
      flash[:danger] = "You have reached the limit for boxes on your plan type"
      redirect_to current_user.profile
    end    
  end

  def show
    @box = Box.find(params[:id])
    if params[:code]
      found_code = @box.codes.find_by(code: params[:code][:code], expired: false)
      if found_code
        flash.now[:notice] = "Code found and added to account"
        found_code.expired = true
        found_code.save
        UserCodedBox.create(user_id: current_user.id, box_id: @box.id)
      else
        flash.now[:danger] = "Invalid code"
      end
    end
  end

  def edit
    @box = Box.find(params[:id])
  end

  def create
    @box = Box.new(box_params)
    @box.user_id = current_user.id
    if @box.save
      flash[:notice] = 'Box has been created'
      redirect_to @box
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to @box, notice: 'Box was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def sms
    if @box.has_valid_codes?
      to_number = params[:sms][:to_number]
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

      code = @box.get_valid_code
      begin 
        @client.account.messages.create({
          :from => '+61476856458',
          :to => to_number, 
          :body => "Follow the link to access your downloads: #{request.base_url}/boxes/#{@box.id}?utf8=✓&code%5Bcode%5D=#{code}&commit=Check+Code"
        })
        flash[:notice] = "Code #{code} sent to #{to_number} via sms"
        redirect_to @box
      rescue
        flash[:warning] = "Something went wrong. Did you enter a valid number?"
        redirect_to @box
      end  
    else  
      flash[:warning] = "You have no more valid codes for this box"
      redirect_to @box
    end  
  end  

  private

    def box_params
      params.require(:box).permit(:title, :description)
    end

    def set_box
      @box = Box.find(params[:id])
    end

end
