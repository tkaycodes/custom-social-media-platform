class RepliesController < ApplicationController
  def create
    @message = Message.find(params[:message_id])
    @reply = @message.replies.new(reply_params)
    if @reply.save
      logger.warn "THIS IS THE REPLY THAT GOT SAVED #{@reply.inspect}"
      redirect_to :back, notice: "replied"
    else
      redirect_to :back, notice: "couldnt reply right now"
    end
  end

  def reply_params
    params.require(:reply).permit(:name, :user_id)
  end
end
