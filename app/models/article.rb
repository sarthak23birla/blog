class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, :description, :category_ids, presence: true
  has_and_belongs_to_many :categories
  mount_uploader :avatar ,AvatarUploader
  has_many :comments

  # ==== scope ======
  scope :active, ->(user){ where("published=? OR author_id=?", true, user.id) } 
  # ==== scope end ======
end