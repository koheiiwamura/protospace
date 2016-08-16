class RemoveUploadImageFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :upload_image, :string
  end
end
