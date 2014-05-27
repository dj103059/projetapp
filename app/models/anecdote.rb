class Anecdote < ActiveRecord::Base
   belongs_to :user
   belongs_to :chapter
   has_many :themes
end
