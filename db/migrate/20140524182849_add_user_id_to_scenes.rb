class AddUserIdToScenes < ActiveRecord::Migration
  def change
   add_column :scenes, :user_id, :integer
  end
end
