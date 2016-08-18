class AddPrototypeIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :prototype_id, :integer
    add_column :images, :upload_image, :string
  end
end
