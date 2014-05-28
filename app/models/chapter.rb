class Chapter < ActiveRecord::Base
  belongs_to :user
  has_many :scenes
  has_many :anecdotes
  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
end
