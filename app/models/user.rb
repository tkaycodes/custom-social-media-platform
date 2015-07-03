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

  validates :email, uniqueness: true
end
