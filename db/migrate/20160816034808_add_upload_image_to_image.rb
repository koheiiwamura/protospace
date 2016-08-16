class AddUploadImageToImage < ActiveRecord::Migration
  def change
    add_column :images, :upload_image, :string
  end
end
