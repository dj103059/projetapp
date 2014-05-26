class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :anecdote_id
      t.integer :scene_id
      t.integer :user_id

      t.timestamps
    end
  end
end
