class Post < ActiveRecord::Base
  include ActionView::Helpers
  has_many :comments, dependent: :destroy
  before_save do |post|
    post.content = sanitize post.content
    post.slug = post.title.downcase.parameterize
    post.day = post.created_at.strftime("%d")
    post.month = post.created_at.strftime("%m")
    post.year = post.created_at.year

    # Hackish? Possibly.
    post.permalink =  '/' + post.year.to_s +
        '/' + post.month.to_s +
        '/' + post.day.to_s +
        '/' + post.slug.to_s
  end

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  def to_string
    title
  end

  def number_of_approved_comments
    approved_comments = 0
    comments.each do |c|
      if c.approved == true then approved_comments += 1 end
    end
    approved_comments
  end
end
