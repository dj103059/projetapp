require 'spec_helper'

describe "Anecdore pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }
  let(:theme) { FactoryGirl.create(:theme) }
  
  describe "anecdote creation" do
    before do
    theme.update_attributes(anecdote_id: 1)
    visit '/anecdote'
    end

    describe "with invalid information" do
      it "should not create a anecdote" do
        expect { click_button "Send" }.not_to change(Anecdote, :count)
      end

      describe "error messages" do
        before { click_button "Send" }
        it { should_not have_content('succes') }
      end
    end
     describe "with valid information" do
      
      before do
       fill_in 'anecdote_content', with: "Lorem ipsum" 
       page.select theme.content, :from => 'anecdote_theme_id'
      end
      it "should create a anecdote" do
        expect { click_button "Send" }.to change(Anecdote, :count).by(1)
      end
    end
  end

     describe "anecdote index" do
       let(:user) { FactoryGirl.create(:user) }
        before do
          10.times {FactoryGirl.create(:anecdote)}
          sign_in user
          visit '/indexanecdote'
        end
        after do
           Anecdote.delete_all
        end 
        describe "on index page" do
          it { should have_selector('title', text:"All Anecdote") }
          it { should have_content("All Anecdote") }
        end
        describe "pagination" do
         it "should list each anecdote" do
          Anecdote.paginate(page: 1).each do |anecdote|
          expect(page).to have_content(anecdote.content)
        end
      end
     end
  end
   
  describe "add anecdote to chapter" do
      let(:chapter) { FactoryGirl.create(:chapter) }
      let(:anecdote) { FactoryGirl.create(:anecdote) }
     before do
      chapter
      anecdote
      visit '/anectochap'
     end

    before do
       page.select chapter.title, :from => 'chapter_chapter_id'
       page.select anecdote.content, :from => 'chapter_anecdote_id'
    end
      it "should add a anecdote to chapter " do
        expect { click_button "Send" }.to change(Anecdote.where(chapter_id: chapter.id), :count).by(1)
      end
      end

   describe "delete a anecdote to anecdote" do
     let(:chapter) { FactoryGirl.create(:chapter) }
     let(:anecdote) { FactoryGirl.create(:anecdote) }
     before do

      chapter
      anecdote
      visit '/dltanectochap'
     end

    before do
       page.select chapter.title, :from => 'chapter_chapter_id'
       page.select anecdote.content, :from => 'chapter_anecdote_id'
    end
      it "should delete a anecdote to chapter " do
        expect { click_button "Send" }.to change(Anecdote.where(chapter_id: chapter.id), :count).by(0)
      end
      end
end
