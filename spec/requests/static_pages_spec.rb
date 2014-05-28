require 'spec_helper'

describe "Static pages" do
  
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'WriteYourOwnStorie' }
    let(:page_title) { nil }

    it_should_behave_like "all static pages"
   end
   describe "Help page" do
    before { visit help_path }
    let(:heading)    { "Help" }
    let(:page_title) { "Help" }

    it_should_behave_like "all static pages"
    it "should have the content 'Help'" do
      visit help_path
      page.should have_content('Help')
    end
   end
  describe "About page" do
   before { visit about_path }
   let(:heading)    { 'About ' }
   let(:page_title) { "About Us" }

   it_should_behave_like "all static pages"
   it "should have the content 'About'" do
     visit about_path
     page.should have_content('About')
   end
 end
end