class Post < ActiveRecord::Base
  belongs_to :user

  def self.types
    %w(Status Image)
  end

  scope :images, -> { where(type: 'Image')}
  scope :statuses, -> { where(type: 'Status')}

  def is_status?
    type == "Status"
  end
  
end

