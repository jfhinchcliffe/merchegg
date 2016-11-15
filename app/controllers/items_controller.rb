class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box
  
  def index
    @items = @box.items.all
  end

  def new
    @item = @box.items.build
  end

  def edit
    @item = @item.find(params[:id])
  end

  def create
    @item = @box.items.build(item_params)
    if @item.save
      redirect_to @box
    else
      render 'new'
    end    
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end     

  private

    def set_box
      @box = Box.find(params[:box_id])
    end   

    def item_params
      params.require(:item).permit(:name, :item_download_path)
    end  

end
