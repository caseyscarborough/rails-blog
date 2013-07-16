# = Comment
#
# This model holds the basic information used for a comment.
# Instances of the model belong to a post, and contain an
# author, email, the content, and whether or not the comment
# has been approved.

class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :content, presence: true

  def self.unapproved_comments
    @comments = []
    Comment.all.each { |c| @comments << c unless c.approved }
    @comments
  end
end
