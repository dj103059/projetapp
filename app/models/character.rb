class Character < ActiveRecord::Base
  belongs_to :user
  has_many :relations, foreign_key: "character_id", dependent: :destroy
  has_many :scenes ,through: :relations, source: :scene
  validates :name, presence: true, length: { maximum: 30 }
  validates :user_id, presence: true

  def playing?(one_scene)
    relations.find_by(scene_id: one_scene.id)
  end

  def play!(one_scene)
    relations.create!(scene_id: one_scene.id)
  end
  def leave!(one_scene)
    relations.find_by(scene_id: one_scene.id).destroy
  end
end
