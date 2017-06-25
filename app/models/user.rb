class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable,:confirmable, :lockable

  has_many :articles, foreign_key: :author_id
  Role = [:admin, :writer, :viewer]
  enum role: Role
  validates :first_name, presence: true
end
