class Image < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :upload_image, ImageUploader

  enum roll: {
    main: 0, # メイン画像
    sub: 1,   # サブ画像
  }
end
