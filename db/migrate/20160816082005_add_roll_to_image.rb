class AddRollToImage < ActiveRecord::Migration
  def change
    add_column :images, :roll, :integer,default: 0
  end
end
