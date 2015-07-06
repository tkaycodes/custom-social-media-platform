class MessagesController < ApplicationController

  def index
    @messages = current_user.recieved_messages.all
    # logger.warn "#{@messages.inspect}"
    # if @messages.empty?
    #   logger.warn "EMPTY"
    # end
  end

  def new
    @message = Message.new
    @message.recipient_id = params[:recipient_id]
    logger.warn "#{@message.inspect}"
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

