class TaggedusersController < ApplicationController
  def index
    #taggedusers is the join table
   @taggedusers=current_user.taggedusers
   @unread = current_user.taggedusers.where(status: "Unread");
  end

  def update
    logger.warn "here are the params #{params.inspect}"
    @taggeduser=Taggeduser.find(params[:id])
    if @taggeduser.update(taggeduser_params)
      respond_to do |format|
        format.html{}
        format.json{render json: @taggeduser.to_json}
      end
    else
      respond_to do |format|
        format.html{}
        format.json{render json: @taggeduser.errors}
      end
    end
  end

  private
  def taggeduser_params
    params.require(:taggeduser).permit(:status, :id)
  end
end
