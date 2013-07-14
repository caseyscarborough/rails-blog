namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do

    [Post, Comment].each(&:delete_all)

    10.times do
      @post = Post.new
      @post.title = Faker::Lorem.sentence
      @post.content = Faker::Lorem.paragraph(20)
      @post.save
      10.times do
        @comment = @post.comments.build
        @comment.author = Faker::Name.name
        @comment.email = Faker::Internet.email
        @comment.content = Faker::Lorem.sentence
        @comment.save
      end
    end
  end
end