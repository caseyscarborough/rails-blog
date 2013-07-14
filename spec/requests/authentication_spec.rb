require 'spec_helper'

describe "Authentication" do

  let(:user) { FactoryGirl.create(:user) }
  let(:first_post) { FactoryGirl.create(:first_post) }
  let(:comment) { first_post.comments.create(author: 'Test User', email: 'test@example.com', content: 'Test content.') }

  subject { page }

  describe "when a user is not logged in" do

    describe "forbidden pages" do

      describe "when editing a post" do
        before { visit edit_post_path first_post }
        it { should have_content('Please login first') }
      end

      describe "when editing a comment" do
        before { visit edit_post_comment_path(first_post, comment) }
        it { should have_content('Please login first') }
      end
    end

    describe "allowed pages" do

      describe "post list" do
        before { visit root_path }
        it { should_not have_content('Edit') }
        it { should_not have_content('Delete') }
      end

      describe "show post" do
        before { visit post_path first_post }
        it { should_not have_content('Edit') }
        it { should_not have_content('Delete') }
      end

    end

  end

  describe "when a user is logged in" do

    before do
      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    describe "when editing a post" do
      before { visit edit_post_path first_post }
      it { should have_content('Edit Post') }
    end

    describe "when editing a comment" do
      before { visit edit_post_comment_path(first_post, comment) }
      it { should have_content('Edit Comment') }
    end

    describe "post list" do
      before { visit root_path }
      it { should have_content('Edit') }
      it { should have_content('Delete') }
    end

    describe "show post" do
      before { visit post_path first_post }
      it { should have_content('Edit') }
      it { should have_content('Delete') }
    end

  end

end