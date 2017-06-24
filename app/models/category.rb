class Category < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true
	has_and_belongs_to_many :articles
end
