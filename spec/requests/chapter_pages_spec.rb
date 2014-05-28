require 'spec_helper'

describe "Chapter pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "chapter creation" do
    before { visit '/chapter' }

    describe "with invalid information" do
      it "should not create a chapter" do
        expect { click_button "Send" }.not_to change(Chapter, :count)
      end

      describe "error messages" do
        before { click_button "Send" }
        it { should_not have_content('succes') }
      end
    end
     describe "with valid information" do

      before { fill_in 'chapter_title', with: "Lorem ipsum" }
      it "should create a chapter" do
        expect { click_button "Send" }.to change(Chapter, :count).by(1)
      end
    end
  end
  
describe "chapter index" do
       let(:user) { FactoryGirl.create(:user) }
        before do
          10.times {FactoryGirl.create(:chapter)}
          sign_in user
          visit '/indexchapter'
        end
        after do
           Chapter.delete_all
        end 
        describe "on index page" do
          it { should have_selector('title', text:"All Chapter") }
          it { should have_content("All Chapter") }
        end
        describe "pagination" do
         it "should list each chapter" do
          Chapter.paginate(page: 1).each do |chapter|
          expect(page).to have_content(chapter.title)
        end
      end
     end
  end
  end