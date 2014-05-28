require 'spec_helper'

describe Character do
  let(:user) { FactoryGirl.create(:user) }
  before { @character = user.characters.build(name: "Lorem ipsum") }

  subject { @character }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:scenes) }
  it { should respond_to(:playing?) }
  it { should respond_to(:play!) }
  it { should respond_to(:leave!) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @character.user_id = nil }
    it { should_not be_valid }
  end

  describe "playing" do
    let(:scene) { FactoryGirl.create(:scene) }
    before do
      @character.save
      @character.play!(scene)
    end
  it { should be_playing(scene) }
  its(:scenes) { should include(scene) }
  
  describe "and leave" do
      before { @character.leave!(scene) }

      it { should_not be_playing(scene) }
      its(:scenes) { should_not include(scene) }
    end

  end



  describe "with blank content" do
    before { @character.name = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @character.name = "a" * 31 }
    it { should_not be_valid }
  end
end

