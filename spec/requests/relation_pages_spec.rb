require 'spec_helper'

describe "Relation page" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }
  describe "add character to scene" do
      let(:character) { FactoryGirl.create(:character) }
      let(:scene) { FactoryGirl.create(:scene) }
     before do
      character
      scene
      visit '/chartoscene'
     end

    before do
       page.select character.name, :from => 'relation_character_id'
       page.select scene.content, :from => 'relation_scene_id'
    end
      it "should add a character to scene " do
        expect { click_button "Send" }.to change(Relation.where(character_id: character.id), :count).by(1)
      end
      end

   describe "delete a character to scene" do
     let(:character) { FactoryGirl.create(:character) }
     let(:scene) { FactoryGirl.create(:scene) }
     before do

      character
      scene
      visit '/dltchartoscene'
     end

    before do
       page.select character.name, :from => 'relation_character_id'
       page.select scene.content, :from => 'relation_scene_id'
    end
      it "should delete a character to scene " do
        expect { click_button "Send" }.to change(Relation.where(character_id: character.id), :count).by(0)
      end
      end
end 