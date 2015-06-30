class FriendshipsController < ApplicationController
 
  def index
    @friendships = current_user.friendships
  end


  def show
  end

  def new
    @friendship = Friendship.new
  end

  def edit
  end

  def create
    @friendship = current_user.friendships.new(:friend_id=>params[:friend_id], :state=>'pending');
      if @friendship.save
        logger.warn "friendship saved and the status is now #{@friendship.state}"
      redirect_to friendships_path, notice: 'Friendship was successfully created.'
      else
        redirect_to root_path, notice: 'User is already your friend!'
      end
    # inverse relationship
    # @friend = @friendship.friend
    # @user = @friendship.user
    # @inverse = @friend.friendships.new(:friend_id=>@user.id, :state=>'requested');
    # if @inverse.save 
    #   logger.warn "inverse saved"
    # else
    #   logger.warn "error making the inverse relationship"
    # end
  end

 
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to friendships_path, notice: "Removed Friendship"

  end

  private
  def create_inverse_friendship
    logger.warn "IM GONA GET CREATED"
  end



end
