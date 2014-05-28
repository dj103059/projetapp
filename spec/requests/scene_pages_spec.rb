require 'spec_helper'

describe "Scene pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }
  let(:character) { FactoryGirl.create(:character) }
  describe "scene creation" do
    before do
    character.relations.build(character_id: character.id)
    visit '/scene'
    end

    describe "with invalid information" do
      it "should not create a scene" do
        expect { click_button "Send" }.not_to change(Scene, :count)
      end

      describe "error messages" do
        before { click_button "Send" }
        it { should_not have_content('succes') }
      end
    end
     describe "with valid information" do
      
      before do
       fill_in 'scene_content', with: "Lorem ipsum" 
       page.select character.name, :from => 'scene_character_id'
      end
      it "should create a scene" do
        expect { click_button "Send" }.to change(Scene, :count).by(1)
      end
    end
  end
  

  describe "scene index" do
       let(:user) { FactoryGirl.create(:user) }
        before do
          10.times {FactoryGirl.create(:scene)}
          sign_in user
          visit '/indexscene'
        end
        after do
           Scene.delete_all
        end 
        describe "on index page" do
          it { should have_selector('title', text:"All Scene") }
          it { should have_content("All Scene") }
        end
        describe "pagination" do
         it "should list each scene" do
          Scene.paginate(page: 1).each do |scene|
          expect(page).to have_content(scene.content)
        end
      end
     end
  end

   describe "add scene to chapter" do
     let(:chapter) { FactoryGirl.create(:chapter) }
     let(:scene) { FactoryGirl.create(:scene) }
     before do

      chapter
      scene
      visit '/scenetochap'
     end

    before do
       page.select chapter.title, :from => 'chapter_chapter_id'
       page.select scene.content, :from => 'chapter_scene_id'
    end
      it "should add a scene to chapter " do
        expect { click_button "Send" }.to change(Scene.where(chapter_id: chapter.id), :count).by(1)
      end
      end
    
    describe "delete a scene to chapter" do
     let(:chapter) { FactoryGirl.create(:chapter) }
     let(:scene) { FactoryGirl.create(:scene) }
     before do

      chapter
      scene
      visit '/dltscenetochap'
     end

    before do
       page.select chapter.title, :from => 'chapter_chapter_id'
       page.select scene.content, :from => 'chapter_scene_id'
    end
      it "should delete a scene to chapter " do
        expect { click_button "Send" }.to change(Scene.where(chapter_id: chapter.id), :count).by(0)
      end
      end

end