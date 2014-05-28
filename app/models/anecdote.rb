class Anecdote < ActiveRecord::Base
   belongs_to :user
   belongs_to :chapter
   has_many :themes
   validates :content, presence: true, length: { maximum: 140 }
   validates :user_id, presence: true

end
