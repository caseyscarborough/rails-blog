# = Post
#
# This model contains the information for blog posts. It has
# many comments and will eventually belong to a user.

class Post < ActiveRecord::Base
  include ActionView::Helpers
  has_many :comments, dependent: :destroy
  before_save do |post|
    post.content = sanitize post.content
    post.slug = post.title.downcase.parameterize
    post.day = post.created_at.strftime('%d')
    post.month = post.created_at.strftime('%m')
    post.year = post.created_at.year

    # Hackish? Possibly.
    post.permalink =  '/' + post.year.to_s +
        '/' + post.month.to_s +
        '/' + post.day.to_s +
        '/' + post.slug.to_s
  end

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  # Gives a humanized representation of the model.
  def to_string
    title
  end

  # Returns the number of approved comments for a post.
  def approved_comments
    approved_comments = []
    comments.each { |c| approved_comments << c if c.approved }
    approved_comments
  end
end
