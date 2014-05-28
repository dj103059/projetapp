class Scene < ActiveRecord::Base
  belongs_to :user
  belongs_to :chapter
  has_many :relations, foreign_key: "scene_id", dependent: :destroy
  has_many :characters ,through: :relations, source: :character
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  def playedby?(one_character)
    relations.find_by(character_id: one_character.id)
  end


  def act!(one_character)
    relations.create!(character_id: one_character.id)
  end
  def fired!(one_character)
    relations.find_by(character_id: one_character.id).destroy
  end
end
