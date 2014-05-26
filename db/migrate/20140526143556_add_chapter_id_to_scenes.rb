class AddChapterIdToScenes < ActiveRecord::Migration
  def change
     add_column :scenes, :chapter_id, :integer
  end
end
