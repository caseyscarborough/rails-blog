require 'faker'

namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do

    # Remove all current posts and comments
    [Post, Comment].each(&:delete_all)

    # Create ten posts with sample data
    puts "Creating posts with comments..."
    10.times do
      @post = Post.create(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraphs(5).join(' '),
        created_at: rand(0..365).days.ago
      )

      # Give each post 5 comments
      5.times do
        @post.comments.create(
          author: Faker::Name.name,
          email: Faker::Internet.email,
          content: Faker::Lorem.sentence
        )
      end
    end


  end
end