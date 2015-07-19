class TagsController < ApplicationController
  def create
    @tag=Tag.new(params.require(:tag).permit(:tag))
    if @tag.save
      respond_to do |format|
        format.json{render json: @tag.to_json}
      end
    else
      respond_to do |format|
        format.json{render json: {errors: @tag.errors.full_messages}}
      end
    end
  end

  def show
    @tag=Tag.find(params[:id])
    @posttags=@tag.posttags
  end
end

