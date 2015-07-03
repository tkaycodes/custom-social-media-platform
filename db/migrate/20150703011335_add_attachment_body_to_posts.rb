class AddAttachmentBodyToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :body
    end
  end

  def self.down
    remove_attachment :posts, :body
  end
end
