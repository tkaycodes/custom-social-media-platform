class CommentsController < ApplicationController

  def create
    @comment=Comment.create(params.require(:comment).permit(:comment, :post_id, :user_id))
    @comment.user_id=current_user.id
    @user=User.find(1)
      respond_to do|format|
         format.html{
          if @comment.save
            redirect_to :back, notice: "comment saved"
            # logger.warn"CHECK THIS OUT #{@comment.inspect}"
            # logger.warn"#{@comment.user.inspect}"
            # logger.warn"CHECK THIS OUT #{@comment.user.email}"
          else
            redirect_to :back, notice: "comment couldnt be saved"
          end
        }
        format.js{}
    end
  end

  def update
    @comment=Comment.find(params[:id])
    logger.warn "update function called, here are the params: #{params.inspect}"
      if @comment.update(params.require(:comment).permit(:comment, :post_id, :user_id))
        logger.warn "comment udpated"
          respond_to do |format|
            format.html{redirect_to :back, notice: "udpated"}
            format.js{}
          end
      else
        logger.warn "error while updating comment"
          respond_to do |format|
            format.html{redirect_to :back, notice: "cant update "}
            format.js{}
          end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      logger.warn "comment deleted"
      respond_to do |format|
        format.html{redirect_to :back, notice: "deleted"}
        format.js{}
      end
    else
      logger.warn "error while deleting comment"
      respond_to do |format|
        format.html{redirect_to :back, notice: "cant delete "}
        format.js{}
      end
    end
  end

end
  