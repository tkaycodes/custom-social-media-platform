class UsersController < ApplicationController
  before_action :authenticate_user!, :only=> [:index]
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
    # (current_user.id)
    # Friendship.find(user: current_user, friend: @user)
    @user = User.find(params[:id])
    @friendship = Friendship.where(user_id: current_user.id, friend_id: @user.id)
    
    @posts = [];
    if !@friendship.empty? && @friendship.first.state == "accepted"
      @posts = @user.posts.order(created_at: :desc)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: "user updated"
    else
      redirect_to root_path, notice: "couldnt update user"
    end
  end

  def admin
  end

  private 

  def user_params
    params.require(:user).permit(:profile_picture)
  end
  
end
