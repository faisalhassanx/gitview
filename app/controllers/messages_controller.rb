class MessagesController < ApplicationController
  before_action :require_user
  
  def create
    @message = Message.new(message_params)
    @message.developer = current_user
    if @message.save
      redirect_to gitchat_path
    else
      render 'chatrooms/show'
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
end