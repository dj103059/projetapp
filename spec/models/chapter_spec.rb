require 'spec_helper'

describe Chapter do
  let(:user) { FactoryGirl.create(:user) }
  before { @chapter= user.chapters.build(title: "Lorem ipsum") }

  subject { @chapter }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @chapter.user_id = nil }
    it { should_not be_valid }
  end
  describe "with blank content" do
    before { @chapter.title = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @chapter.title = "a" * 51 }
    it { should_not be_valid }
  end
end
