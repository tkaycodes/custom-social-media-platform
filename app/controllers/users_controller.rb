class UsersController < ApplicationController
  def index
    @users=User.all
    if user_signed_in?
      @usersminusself = User.where.not(email: current_user.email)
    end
    respond_to do |format|
      format.html{}
      format.json{render :json=>@users}
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def admin
  end
  
end
