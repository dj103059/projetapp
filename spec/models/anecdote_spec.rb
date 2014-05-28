require 'spec_helper'

describe Anecdote do
  let(:user) { FactoryGirl.create(:user) }
  before { @anecdote = user.anecdotes.build(content: "Lorem ipsum") }

  subject { @anecdote }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @anecdote.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @anecdote.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @anecdote.content = "a" * 141 }
    it { should_not be_valid }
  end
end
