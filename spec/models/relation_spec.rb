require 'spec_helper'

describe Relation do

  let(:scene) { FactoryGirl.create(:scene) }
  let(:character) { FactoryGirl.create(:character) }
  let(:relation) { scene.relations.build(character_id: character.id) }

  subject { relation }

  it { should be_valid }
  describe "scene methods" do
    it { should respond_to(:scene) }
    it { should respond_to(:character) }
    its(:scene) { should eq scene }
    its(:character) { should eq character }
  end
  describe "when character id is not present" do
    before { relation.character_id = nil }
    it { should_not be_valid }
  end
  describe "when scene id is not present" do
    before { relation.scene_id = nil }
    it { should_not be_valid }
  end
end
