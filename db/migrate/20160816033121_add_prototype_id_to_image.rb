class AddPrototypeIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :prototype_id, :integer
  end
end
