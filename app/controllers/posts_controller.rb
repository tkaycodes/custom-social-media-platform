class PostsController < ApplicationController
   # before_action :set_post, only: [:new, :create]
  def new
    @post = current_user.posts.new
    @post.type = params[:type]
    logger.warn "HERE IS THE POST #{@post.inspect}"
    logger.warn "THE TYPE IS #{@post.type}"
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:body, :type))
    if @post.save 
      redirect_to user_profile_path(current_user), notice: "saved"
    else
      redirect_to root_profile_path(current_user), notice: "couldnt save"
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  # private
  # def set_post
  #   @post = current_user.posts.new
  #   @post.type = params[:type]
  # end
end
