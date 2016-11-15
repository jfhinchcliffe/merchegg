class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only:[:show, :edit, :update, :payment]

  def index
    @boxes = current_user.boxes.all
  end  

  def new
    @box = current_user.boxes.build
  end

  def show
    @box = Box.find(params[:id])
  end

  def edit
    @box = Box.find(params[:id])
  end

  def create
    @box = Box.new(box_params)
    @box.user_id = current_user.id
    if @box.save
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
