class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prototypes
  has_many :likes
  has_many :comments
  mount_uploader :avatar, ImageUploader

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum:8}
  validates :member, presence: true
  validates :profile, presence: true
  validates :works, presence: true
  validates :avatar, presence: true
end
