class TaggedusersController < ApplicationController
  def index
   @taggedposts=current_user.tagged_posts
   @unread = current_user.taggedusers.where(Status=="Unread");
  end

  def update
    @taggeduser=Taggeduser.find(params[:id])
    if @taggeduser.update(params[:status])
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
end
