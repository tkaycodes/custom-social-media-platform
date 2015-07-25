class Taggeduser < ActiveRecord::Base
  after_create :set_status

  belongs_to :user
  belongs_to :post

  def set_status
    self.status = 'Unread'
    self.save!
  end
end
