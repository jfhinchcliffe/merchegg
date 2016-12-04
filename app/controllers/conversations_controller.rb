class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @conversation = Conversation.create(sender: current_user.id, receiver: params[:messaging])
    @from = User.find(@conversation.sender)
    @to = User.find(@conversation.receiver)
    @message = @conversation.messages.build
  end  

  def show
    @conversation = Conversation.find(params[:id])
    @from = User.find(@conversation.sender)
    @to = User.find(@conversation.receiver)
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
