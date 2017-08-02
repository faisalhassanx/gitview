class MessagesController < ApplicationController
  before_action :require_user
  
  def create
    @message = Message.new(message_params)
    @message.developer = current_user
    if @message.save
      ActionCable.server.broadcast "chatroom_channel", message: render_message(@message), 
                                                       developer: @message.developer.name
    else
      flash[:danger] = "Please try again"
      redirect_back fallback_location: root_path
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
  def render_message(message)
    render(partial: 'message', locals: { message: message } )
  end
  
end