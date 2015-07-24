class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  #join table
  has_many :posttags

  #posttags.tag
  has_many :tags, through: :posttags 
  
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  # join table
  has_many :taggedusers 

  #taggedusers.user
  has_many :user_tags, through: :taggedusers, source: :user


  def self.types
    %w(Status Image)
  end

  scope :images, -> { where(type: 'Image')}
  scope :statuses, -> { where(type: 'Status')}

  def is_status?
    type == "Status"
  end

end


