class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end
