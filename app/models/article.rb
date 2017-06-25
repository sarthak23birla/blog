class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  validates :title, :description, :category_ids, presence: true
  has_and_belongs_to_many :categories
  mount_uploader :avatar ,AvatarUploader  
end