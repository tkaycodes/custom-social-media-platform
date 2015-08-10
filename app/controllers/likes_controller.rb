class LikesController < ApplicationController
  def create
    logger.warn " here are the params: #{params.inspect}"
    @like = Like.new(user_id: current_user.id, post_id: params[:id])
    if @like.save
          logger.warn "post was like here it is: #{@like.inspect}"

      respond_to do |format|
        format.html{
          redirect_to :back, notice: 'liked'
        }
        format.json{
          render json: @like.to_json
        }
      end
    else
      respond_to do |format|
        format.html{
          redirect_to :back, notice: 'cant like'
          logger.warn "cant like!!"
        }
        format.json{
          render json: {error: @like.errors} 
        }
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.delete
      respond_to do |format|
        format.html{
          redirect_to :back, notice: 'Unliked'
        }
        format.json{
          render json: {status: 200, notice: 'unliked'}        
        }
      end
    else
      respond_to do |format|
        format.html{
          redirect_to :back, notice: 'Couldnt Unlike'
        }
        format.json{
          render json: {status: unprocessable_entity, notice: 'couldnt unlike'}
        }
      end
    end
  end
end
