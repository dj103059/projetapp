class Theme < ActiveRecord::Base
  belongs_to :user
  belongs_to :anecdote
  validates :content, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
end
