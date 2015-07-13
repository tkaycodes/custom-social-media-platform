class Friendship < ActiveRecord::Base
  after_create :create_inverse_friendship
  after_destroy :destroy_inverse_friendship

  validates :user_id, uniqueness: {scope: :friend_id}
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def opposite
    # user = self.user_id;
    # friend=self.friend_id;
    return Friendship.where(user_id:friend,friend_id:user);
  end

 

  private


  def create_inverse_friendship
    @inverse = friend.friendships.create(friend_id: user.id, state: 'requested')
    if @inverse
      logger.warn "inverse relation created!"
    else
      logger.warn "error while creating inverse"
    end
  end

  def destroy_inverse_friendship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end

    

  # def self.accept_request
  #   self.state = 'accepted'
  #   self.save
  # end
end
