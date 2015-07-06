class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
end
