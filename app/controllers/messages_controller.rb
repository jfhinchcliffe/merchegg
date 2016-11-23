class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.content = params[:message][:content]
    if @message.save
      flash[:notice] = 'message was created'
      redirect_to conversations_path
    else
      redirect_to root_path
    end
  end  


  private

    def message_params
      params.require(:message).permit(:content)  
    end  

end
