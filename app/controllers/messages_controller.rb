class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation
  def new
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      flash[:notice] = 'message was created'
      redirect_to conversation_path(@conversation)
    else
      redirect_to conversation_path(@conversation)
    end
  end  


  private

    def message_params
      params.require(:message).permit(:content)
    end

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end  

end
