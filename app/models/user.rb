class User < ActiveRecord::Base
  attr_accessor :login

  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('defaultpic.jpg');
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/ 
  validates :username, uniqueness: true;
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


  # validates :email, uniqueness: true

  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  #necessary cause relation User.posts already exists, so need new name

  #join table
  has_many :taggedusers

  #taggeduser.posts
  has_many :tagged_posts, through: :taggedusers, source: :post

  # def set_default_avatar
  #   self.profile_picture = 'defaultpic.jpg'
  # end

  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions.to_hash).first
    end
  end


end
