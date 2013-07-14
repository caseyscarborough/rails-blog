class Post < ActiveRecord::Base
  include ActionView::Helpers
  has_many :comments, dependent: :destroy
  before_save { |post| post.content = sanitize post.content }

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
