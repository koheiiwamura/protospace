class Prototype < ActiveRecord::Base
  has_many :images
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
end
