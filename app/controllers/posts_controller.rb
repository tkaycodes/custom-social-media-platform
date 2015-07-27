class PostsController < ApplicationController
   # before_action :set_post, only: [:new, :create]
  def new
    @post = current_user.posts.new
    @post.type = params[:type]
    @tag=Tag.new
    logger.warn "HERE IS THE POST #{@post.inspect}"
    logger.warn "THE TYPE IS #{@post.type}"
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:body, :type, {tag_ids:[]}))
    if @post.save 
      redirect_to user_profile_path(current_user), notice: "saved"
      logger.warn "SAVED HERE IS THE INFO:#{@post.inspect}"
    else
      redirect_to user_profile_path(current_user), notice: "coudlnt save"
      logger.warn "THIS IS WHY WE CANT SAVE:#{@post.errors.inspect}"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.new(user_id: current_user.id)
    @comment.user=current_user
    @liked=Like.where(user_id:current_user.id, post_id: @post.id)
    @firstone=@liked.first
    respond_to do |format|
      format.html
      format.js
    end
  end


  # private
  # def set_post
  #   @post = current_user.posts.new
  #   @post.type = params[:type]
  # end
end
