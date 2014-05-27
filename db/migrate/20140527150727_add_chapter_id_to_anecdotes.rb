class AddChapterIdToAnecdotes < ActiveRecord::Migration
  def change
     add_column :anecdotes, :chapter_id, :integer
  end
end
