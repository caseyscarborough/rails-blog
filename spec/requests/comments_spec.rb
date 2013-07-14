require 'spec_helper'

describe "Comments" do

  subject { page }
  first_post = FactoryGirl.create(:first_post)

  before { visit post_path first_post }

  describe "with invalid information" do
    it "should not create a new comment" do
      expect { click_button "Create Comment" }.to change(Comment, :count).by(0)
    end
  end

  describe "with valid information" do
    before do
      fill_in "Author", with: Faker::Name.name
      fill_in "Email", with: Faker::Internet.email
      fill_in "Comment", with: Faker::Lorem.paragraph
    end
    it "should create a new comment" do
      expect { click_button "Create Comment" }.to change(Comment, :count).by(1)
    end
  end

end