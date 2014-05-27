class AddThemeIdToAnecdotes < ActiveRecord::Migration
  def change
     add_column :anecdotes, :theme_id, :integer
  end
end
