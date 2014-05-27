class Theme < ActiveRecord::Base
  belongs_to :user
  belongs_to :anecdote
end
