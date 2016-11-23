class ConversationsController < ApplicationController
  
  def new
    @conversation = Conversation.new
    @conversation.sender = current_user.id
    @conversation.receiver = params[:messaging]
    @conversation.save
    @message = @conversation.messages.build
  end  

  def index
    sent = Conversation.where(sender: current_user)
    received = Conversation.where(receiver: current_user)
    @conversations = sent + received
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      flash[:notice] = 'Conversation was created'
      redirect_to conversations_path
    else
      render 'new'
    end
  end

  private

    def conversation_params
      params.require(:conversation).permit(:sender, :receiver)
    end




end
