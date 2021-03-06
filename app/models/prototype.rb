class Prototype < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

  acts_as_ordered_taggable_on :prototypes
  acts_as_taggable

  def main_image
    images.main.first.image
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def sub_images
    images.sub
  end
end
