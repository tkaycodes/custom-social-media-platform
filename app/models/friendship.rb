class Friendship < ActiveRecord::Base
  after_create :create_inverse_friendship

  validates :user_id, uniqueness: {scope: :friend_id}
  belongs_to :user
  belongs_to :friend, class_name: "User"

  private
  def create_inverse_friendship
    if friend.friendships.create(friend: user, state: 'requested');
      logger.warn "inverse relation created!"
    else
      logger.warn "error while creating inverse"
    end
    # Friendship.create(user_id:9, friend_id:100);
  end
end
