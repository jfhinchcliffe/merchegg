class CodesController < ApplicationController
  before_action :find_box
  def index
    @codes = @box.codes.all
  end

  private

  def find_box
    @box = Box.find(params[:box_id])
  end  

 
end
