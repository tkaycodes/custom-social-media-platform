class UsersController < ApplicationController
  def index
    @users=User.all
    if user_signed_in?
      @usersminusself = User.where.not(email: current_user.email)
    end
  end
end
