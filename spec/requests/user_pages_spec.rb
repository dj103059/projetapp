require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:theme) { FactoryGirl.create(:theme, user: user, content: "Foo") }
    let!(:character) { FactoryGirl.create(:character, user: user, name: "Foo") }
    let!(:scene) { FactoryGirl.create(:scene, user: user, content: "Bar") }
    let!(:anecdote) { FactoryGirl.create(:anecdote, user: user, content: "Bar") }
    let!(:chapter) { FactoryGirl.create(:chapter, user: user, title: "Bar") }
    before { visit user_path(user) }

    it { should have_selector('h1', text:user.name) }
    it { should have_selector('title', text:user.name) }

    describe "all" do
      it { should have_content(theme.content) }
      it { should have_content(character.name) }
      it { should have_content(scene.content) }
      it { should have_content(anecdote.content) }   
      it { should have_content(chapter.title) }
    end
    end
    describe "edit" do

      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        visit edit_user_path(user)
     end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_selector('title', text:full_title("Edit user")) }
      
    end
    
    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_selector('title', text:full_title(new_name)) }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end    

    end

  end


