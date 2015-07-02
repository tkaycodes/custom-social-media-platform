class Friendship < ActiveRecord::Base
  after_create :create_inverse_friendship

  validates :user_id, uniqueness: {scope: :friend_id}
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def opposite
    # user = self.user_id;
    # friend=self.friend_id;
    # return Friendship.where(user_id:friend,friend_id:user);
    return friend.friendships
  end

  def set_state
    self.state = "Accepted"
    self.save
  end

  private
  def create_inverse_friendship
    @inverse = friend.friendships.create(friend: user, state: 'requested')
    if @inverse
      logger.warn "inverse relation created!"
    else
      logger.warn "error while creating inverse"
    end
  end

  # def self.accept_request
  #   self.state = 'accepted'
  #   self.save
  # end
end
