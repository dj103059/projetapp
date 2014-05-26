class Relation < ActiveRecord::Base
  belongs_to :character, class_name: "Character"
  belongs_to :scene, class_name: "Scene"
end
