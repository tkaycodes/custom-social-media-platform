class RepliesController < ApplicationController
  def create
    @message = Message.find(params[:message_id])
    @reply = @message.replies.new(reply_params)
    if @reply.save
      respond_to do |format|
        format.html{
          logger.warn "THIS IS THE REPLY THAT GOT SAVED #{@reply.inspect}"
          redirect_to :back, notice: "replied"
        }
        format.js{}
      end
    else
      respond_to do |format|
        format.html{
          redirect_to :back, notice: "couldnt reply right now"
        }
        format.js{}
      end
    end
  end

  def reply_params
    params.require(:reply).permit(:name, :user_id)
  end
end


 # @message = Message.find(params[:id])
 #    logger.warn " here is the output: #{@ans}"
 #    if (@message.sender_id).to_s==(current_user.id).to_s
 #      @istartedit=@message
 #      @reply=@istartedit.replies.new(:user_id=>current_user.id)
 #    else
 #      @hestartedit=@message
 #      @reply=@hestartedit.replies.new(:user_id=>current_user.id)
 #    end