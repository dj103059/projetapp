require 'spec_helper'

describe "Character pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "character creation" do
    before { visit '/character' }

    describe "with invalid information" do
      it "should not create a character" do
        expect { click_button "Send" }.not_to change(Character, :count)
      end

      describe "error messages" do
        before { click_button "Send" }
        it { should_not have_content('succes') }
      end
    end
     describe "with valid information" do

      before { fill_in 'character_name', with: "Lorem ipsum" }
      it "should create a theme" do
        expect { click_button "Send" }.to change(Character, :count).by(1)
      end
    end
  end

describe "character index" do
       let(:user) { FactoryGirl.create(:user) }
        before do
          10.times {FactoryGirl.create(:character)}
          sign_in user
          visit '/indexcharacter'
        end
        after do
           Character.delete_all
        end 
        describe "on index page" do
          it { should have_selector('title', text:"All Character") }
          it { should have_content("All Character") }
        end
        describe "pagination" do
         it "should list each character" do
          Character.paginate(page: 1).each do |character|
          expect(page).to have_content(character.name)
        end
      end
     end
  end

  end

