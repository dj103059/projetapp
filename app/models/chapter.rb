class Chapter < ActiveRecord::Base
  belongs_to :user
  has_many :scenes
  has_many :anecdotes
end
