class FriendshipsController < ApplicationController
  before_action :set_values, only: [:index]
  before_action :set_inverse_state, only: [:index]

 
  def index
    respond_to do |format|
      format.html{}
      format.json {render json:@friendships}
    end
  end


  def show
  end

  # def new
  #   @friendship = Friendship.new
  # end

  def edit
  end

  def create
    @friendship = current_user.friendships.new(:friend_id=>params[:friend_id], :state=>'pending');
    # @inverseid = @inverse.id
      if @friendship.save
        logger.warn "friendship saved and the status is now #{@friendship.state}"
        # logger.warn "the inverse relationship id is #{@inverseid}"
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
    @friendship = Friendship.find(params[:id])
    logger.warn "current friendship is #{@friendship.id}"
    logger.warn "the state is currently #{params[:state]}"
    respond_to do |format|
      format.html{}
      format.json{
        if @friendship.update(state: params[:state])
          render json: @friendship
        else
          render json: @friendship.errors, status: :unprocessable_entity
        end
      }
    end
  end
    
    # respond_to do |format|

    #   if @friendship.update(friendship_params)
    #     format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @friendship }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @friendship.errors, status: :unprocessable_entity }
    #   end
    # end

  # end

  
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to friendships_path, notice: "Removed Friendship"

  end

  private
 
  def set_values
    logger.warn "setting values"
    @friendships = current_user.friendships;
    # logger.warn "#{@friendships}"
    @accepted_friendships=current_user.friendships.where(state:'accepted');
    @declined_friendships=current_user.friendships.where(state:'declined');
    @requested_friendships=current_user.friendships.where(state:'requested');
    @sent_friendships=current_user.friendships.where(state:'pending');
  end

  def set_inverse_state
    logger.warn "CHECK 2"
    # logger.warn "#{@sent_friendships.inspect}"
    @sent_friendships.each do |x|
      # logger.warn "#{x.opposite.first.inspect}"
      logger.warn "#{x.opposite.inspect}"
      logger.warn "break"
      x.opposite.each do |indy|
        logger.warn "#{indy.inspect}"
          if indy.state == "accepted"
             logger.warn "BOOYAAAA"
              x.state = "accepted"
              x.save!
              logger.warn "#{x.inspect}"
          else
            logger.warn "HAH"
          end
      end
    end
  end

  
    # @requested_friendships.each do |x|
    #   if x.opposite.first.state == "Accepted"
    #       logger.warn "State is Accepted"
    #     # x.state = "Accepted"
    #     # x.save
    #   else
    #       logger.warn "NOTHIN BRAH"
    #   end
    # end
  # end



end
