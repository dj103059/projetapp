class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :content
      t.integer :user_id
      t.integer :anecdote_id

      t.timestamps
    end
  end
end
