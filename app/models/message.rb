class Message < ActiveRecord::Base
  after_create :set_status
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  has_many :replies

  private
  def set_status
    # logger.warn "CHECK"
    self.status='Unread'
    self.save!
  end
end
