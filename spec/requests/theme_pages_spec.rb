require 'spec_helper'

describe "Theme pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "theme creation" do
    before { visit '/theme' }

    describe "with invalid information" do
      it "should not create a theme" do
        expect { click_button "Send" }.not_to change(Theme, :count)
      end

      describe "error messages" do
        before { click_button "Send" }
        it { should_not have_content('succes') }
      end
    end
     describe "with valid information" do

      before { fill_in 'theme_content', with: "Lorem ipsum" }
      it "should create a theme" do
        expect { click_button "Send" }.to change(Theme, :count).by(1)
      end
    end
  end

  describe "theme index" do
       let(:user) { FactoryGirl.create(:user) }
        before do
          10.times {FactoryGirl.create(:theme)}
          sign_in user
          visit '/indextheme'
        end
        after do
           Theme.delete_all
        end 
        describe "on index page" do
          it { should have_selector('title', text:"All Theme") }
          it { should have_content("All Theme") }
        end
        describe "pagination" do
         it "should list each theme" do
          Theme.paginate(page: 1).each do |theme|
          expect(page).to have_content(theme.content)
        end
      end
     end
  end
   
   describe "add theme to anecdote" do
      let(:theme) { FactoryGirl.create(:theme) }
      let(:anecdote) { FactoryGirl.create(:anecdote) }
     before do
      theme
      anecdote
      visit '/themtoanec'
     end

    before do
       page.select theme.content, :from => 'chapter_theme_id'
       page.select anecdote.content, :from => 'chapter_anecdote_id'
    end
      it "should add a theme to anecdote " do
        expect { click_button "Send" }.to change(Theme.where(anecdote_id: anecdote.id), :count).by(1)
      end
      end

   describe "delete a theme to anecdote" do
     let(:theme) { FactoryGirl.create(:theme) }
     let(:anecdote) { FactoryGirl.create(:anecdote) }
     before do

      theme
      anecdote
      visit '/dltthemtoanec'
     end

    before do
       page.select theme.content, :from => 'chapter_theme_id'
       page.select anecdote.content, :from => 'chapter_anecdote_id'
    end
      it "should delete a theme to anecdote " do
        expect { click_button "Send" }.to change(Theme.where(anecdote_id: anecdote.id), :count).by(0)
      end
      end
end

