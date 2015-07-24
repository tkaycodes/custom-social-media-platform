class TaggedusersController < ApplicationController
  def index
   @taggedposts=current_user.tagged_posts
  end
end
