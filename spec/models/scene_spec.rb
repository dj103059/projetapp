require 'spec_helper'

describe Scene do
  let(:user) { FactoryGirl.create(:user) }
  before { @scene = user.scenes.build(content: "Lorem ipsum") }

  subject { @scene }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:characters) }
  it { should respond_to(:playedby?) }
  it { should respond_to(:act!) }
  it { should respond_to(:fired!) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @scene.user_id = nil }
    it { should_not be_valid }
  end

  describe "playedby" do
    let(:character) { FactoryGirl.create(:character) }
    before do
      @scene.save
      @scene.act!(character)
    end
  it { should be_playedby(character) }
  its(:characters) { should include(character) }
  
  describe "and fired" do
      before { @scene.fired!(character) }

      it { should_not be_playedby(character) }
      its(:characters) { should_not include(character) }
    end

  end



  describe "with blank content" do
    before { @scene.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @scene.content = "a" * 141 }
    it { should_not be_valid }
  end
end
