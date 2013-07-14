require 'spec_helper'

describe "Post" do

  post = FactoryGirl.create(:first_post)

  subject { post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  describe "when title is not present" do
    before { post.title = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { post.content = nil }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { post.title = "a" * 256 }
    it { should_not be_valid }
  end

end