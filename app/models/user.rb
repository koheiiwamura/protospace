class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prototypes

  validates :username, presence: true, length: {maximum:10}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum:8}
  validates :member, presence: true
  validates :profile, presence: true
  validates :works, presence: true
end
