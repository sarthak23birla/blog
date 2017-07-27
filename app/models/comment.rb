class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :commentor, class_name: 'User'
  has_many :replies, class_name: "Comment", foreign_key: "comment_id"
  belongs_to :comment, class_name: "Comment" , optional: true
  validates :body, presence: true
end
