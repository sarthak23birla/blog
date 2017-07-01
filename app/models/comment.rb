class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :commentor, class_name: 'User'
end
