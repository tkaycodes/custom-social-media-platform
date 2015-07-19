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

end
  