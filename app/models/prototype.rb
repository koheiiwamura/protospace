class Prototype < ActiveRecord::Base
  has_many :images
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

  def main_img
    images.main.first.image
  end

  def sub_img_first
    images.sub.first.image
  end

  def sub_img_second
    images.sub.second.image
  end
end
