class Prototype < ActiveRecord::Base
  has_many :images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

  def main_img
    images.main.first.image
  end

  def sub_img
    images.sub
  end
end
