class User < ActiveRecord::Base
  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('defaultpic.jpg');
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/ 
  
  # after_create :set_default_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :replies
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships
  has_many :friends, :through=> :friendships
  has_many :posts, dependent: :destroy
  has_many :images
  has_many :statuses
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :recieved_messages, class_name: "Message", foreign_key: :recipient_id


  validates :email, uniqueness: true

  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  #join table
  has_many :taggedusers

  #taggeduser.posts
  has_many :tagged_posts, through: :taggedusers, source: :post

  # def set_default_avatar
  #   self.profile_picture = 'defaultpic.jpg'
  # end


end
