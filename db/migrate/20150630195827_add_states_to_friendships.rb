class AddStatesToFriendships < ActiveRecord::Migration
  def change
    change_table :friendships do |f|
      f.string :state
    end
  end
end
