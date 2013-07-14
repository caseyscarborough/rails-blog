require 'spec_helper'

describe Comment do
  post = FactoryGirl.create(:first_post)
  comment = post.comments.build(author: 'Test User', email: 'test@example.com', content: 'Test content.')

  subject { comment }

  it { should respond_to(:author) }
  it { should respond_to(:email) }
  it { should respond_to(:content) }
  it { should respond_to(:post) }
  it { should respond_to(:post_id) }
  its(:post) { should == post }

  describe "when author is not present" do
    before { comment.author = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { comment.content = nil }
    it { should_not be_valid }
  end

  describe "when author's email is not present" do
    before { comment.email = nil }
    it { should_not be_valid }
  end

  describe "when author is too long" do
    before { comment.author = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { comment.email = "a" * 101 }
    it { should_not be_valid }
  end


end
