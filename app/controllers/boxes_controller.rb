class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only:[:show, :edit, :update, :payment]

  def index
    @boxes = current_user.boxes.all.includes(:codes)
  end  

  def new
    @box = current_user.boxes.build
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

  private

    def box_params
      params.require(:box).permit(:title, :description)
    end

    def set_box
      @box = Box.find(params[:id])
    end

end
