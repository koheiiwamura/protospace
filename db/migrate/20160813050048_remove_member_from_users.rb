class RemoveMemberFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :Member, :text
  end
end
