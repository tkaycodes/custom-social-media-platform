class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :posttags
  has_many :tags, through: :posttags 
  has_many :likes
  has_many :taggedusers
  # has_many :users, through: :likes


  def self.types
    %w(Status Image)
  end

  scope :images, -> { where(type: 'Image')}
  scope :statuses, -> { where(type: 'Status')}

  def is_status?
    type == "Status"
  end

end


