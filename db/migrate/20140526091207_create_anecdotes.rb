class CreateAnecdotes < ActiveRecord::Migration
  def change
    create_table :anecdotes do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
