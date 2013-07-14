require 'spec_helper'

describe "Posts" do

  subject { page }
  first_post = FactoryGirl.create(:first_post)
  second_post = FactoryGirl.create(:second_post)
  random_post = FactoryGirl.create(:random_post)

  describe "list page" do

    before { visit posts_path }
    it { should have_content('Post List') }

    describe "should contain new post link" do
      it { should have_link('New Post') }
    end

    describe "should contain a list of created posts" do
      it { should have_content(first_post.title) }
      it { should have_content(second_post.title) }
      it { should have_content(random_post.title) }
    end
  end

  describe "new post page" do
    it { should have_title('New Post') }
    it { should have_button('Create Post') }
    before { visit new_post_path }

    describe "with invalid information" do
      it "should not create a new post" do
        expect { click_button "Create Post" }.to change(Post, :count).by(0)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title", with: "Random Title"
        fill_in "Content", with: "Random content."
      end

      it "should create a new post" do
        expect { click_button "Create Post" }.to change(Post, :count).by(1)
      end
    end

  end

  describe "edit post page" do
    before { visit edit_post_path first_post }
    it { should have_title('Edit Post') }
    it { should have_title('') }

    describe "with valid information" do
      before { click_button "Update Post" }
      it { should have_selector('.alert') }
      it { should have_content('successfully updated') }
    end

    describe "with invalid information" do
      before do
        fill_in "Title", with: "a" * 256
        fill_in "Content", with: ""
        click_button "Update Post"
      end

      it { should have_selector('.error') }
      it { should have_content('error') }
    end

  end

end
