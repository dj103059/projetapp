require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_selector('title', text:full_title('Sign in')) }
  end
  
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error' , text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_selector('title', text: user.name ) }
      it { should have_link('Chapters',       href: '/indexchapter') }
      it { should have_link('Characters',       href: '/indexcharacter') }
      it { should have_link('Themes',       href: '/indextheme') }
      it { should have_link('Scenes',       href: '/indexscene') }
      it { should have_link('Anecdotes',       href: '/indexanecdote') }
      it { should have_link('Chapters',       href: '/chapter') }
      it { should have_link('Characters',       href: '/character') }
      it { should have_link('Themes',       href: '/theme') }
      it { should have_link('Scenes',       href: '/scene') }
      it { should have_link('Anecdotes',       href: '/anecdote') }
      it { should have_link('Characters to scenes',       href: '/chartoscene') }
      it { should have_link('Scenes to chapters',       href: '/scenetochap') }
      it { should have_link('Anecdotes to chapters',       href: '/anectochap') }
      it { should have_link('Themes to anecdotess',       href: '/themtoanec') }
      it { should have_link('Characters to scenes',       href: '/dltchartoscene') }
      it { should have_link('Scenes to chapters',       href: '/dltscenetochap') }
      it { should have_link('Anecdotes to chapters',       href: '/dltanectochap') }
      it { should have_link('Themes to anecdotes',       href: '/dltthemtoanec') }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }


      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
      
    end
  end

end