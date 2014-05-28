require 'spec_helper'

describe Theme do
  let(:user) { FactoryGirl.create(:user) }
  before { @theme = user.themes.build(content: "Lorem ipsum") }

  subject { @theme }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @theme.user_id = nil }
    it { should_not be_valid }
  end
  describe "with blank content" do
    before { @theme.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @theme.content = "a" * 51 }
    it { should_not be_valid }
  end
   
end

