class UserCodedBoxesController < ApplicationController

  def new(box, user)
    UserCodedBox.create(user_id: user.id, box_id: box.id)
  end

  def index
    @usercodedboxes = current_user.user_coded_boxes.all
  end  

end
