class Image < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  enum roll: { main: 0, sub: 1 }
end
