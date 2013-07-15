class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :content, presence: true

  def self.unapproved_comments
    @comments = []
    Comment.all.each { |c| !c.approved ? @comments << c : next }
    @comments
  end
end
