class MessagesController < ApplicationController

  def index
    @messages = current_user.recieved_messages.all
    @sentmessages = current_user.sent_messages.all
  end

  def new
    @message = Message.new
    @message.recipient_id = params[:recipient_id]
    logger.warn "#{@message.inspect}"
  end

  def show
    @message = Message.find(params[:id])
    @reply = @message.replies.new(:user_id=>current_user.id)
  end

  def create
    @message = current_user.sent_messages.new(params.require(:message).permit(:message, :recipient_id))
    if @message.save
        redirect_to root_path, notice: "message sent"

      logger.warn "message saved and it is: #{@message.inspect}"
    else
      #redirect_to root_path, notice: "notsaved"
      logger.warn "could not send"
    end
  end 

end

