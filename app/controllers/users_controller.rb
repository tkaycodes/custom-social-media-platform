class UsersController < ApplicationController
  before_action :authenticate_user!, :only=> [:index]
  def index
    # @paramz=params[:check]
    # render text: @paramz.inspect
    @users=User.all
    if user_signed_in?
      @usersminusself = User.where.not(email: current_user.email)
    end
    respond_to do |format|
      format.html{}
      format.json{render :json=>@users}
    end
    @comment = Comment.new

  end

  def show
    @user = User.find(params[:id])
    @friendship = Friendship.where(user_id: current_user.id, friend_id: @user.id)  
    if (!@friendship.empty? && @friendship.first.state == "accepted") || current_user.id==@user.id 
      
      @posts = @user.posts.order(created_at: :desc)
    else
      @posts = [];
    end
    # logger.warn " check this out: #{@user.posts.each do |x| x.inspect end}"
    @comment = Comment.new
    
  end

  def find_user
    @userid=params[:usersearch] 
    # @id=params[:id] 
    # render json: @userid.inspect + @id.inspect
    if @userid
    @returnedusers=User.where('username LIKE :prefix', prefix: "#{@userid}%")
    render json: @returnedusers
    # render json: @userid.inspect
    else
      render json: []
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
