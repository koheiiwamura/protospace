class AddMemberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member, :text
    add_column :users, :profile, :text
    add_column :users, :works, :text
  end
end
