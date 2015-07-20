class LikesController < ApplicationController
  def create
    logger.warn " here are the params: #{params.inspect}"
    @like = Like.new(user_id: current_user.id, post_id: params[:id])
    if @like.save
      redirect_to :back, notice: 'liked'
      logger.warn "post was like here it is: #{@like.inspect}"
    else
      redirect_to :back, notice: 'cant like'
      logger.warn "cant like!!"
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.delete
      redirect_to :back, notice: 'Unliked'
    else
      redirect_to :back, notice: 'Couldnt Unlike'
    end
  end
end
