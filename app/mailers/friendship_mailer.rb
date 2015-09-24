class FriendshipMailer < ApplicationMailer

  default from: "tkhn003@gmail.com"

  def friendship_email(friendship)
    @friendship = friendship
    @desired_friend = @friendship.friend
    mail(to: @desired_friend.email, subject: "Youve recieved a friend request")
  end

end
