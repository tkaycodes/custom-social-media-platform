class CommentsController < ApplicationController

  def create
    @comment=Comment.create(params.require(:comment).permit(:comment, :post_id, :user_id))
    if @comment.save
      redirect_to root_path, notice: "saved"
    else
      redirect_to root_path, notice: "not saved"
    end
  end

end
