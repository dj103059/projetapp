class Relation < ActiveRecord::Base
  belongs_to :character, class_name: "Character"
  belongs_to :scene, class_name: "Scene"
  validates :character_id, presence: true
  validates :scene_id, presence: true
end
