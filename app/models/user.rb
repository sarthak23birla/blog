class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable,:confirmable, :lockable, :timeoutable,
     :omniauthable ,:omniauth_providers => [:facebook]
  has_many :articles, foreign_key: :author_id
  Role = [:admin, :writer, :viewer]
  enum role: Role
  validates :first_name, presence: true
  mount_uploader :image, ImageUploader
  def self.new_with_session(params,session)
  	super.tap do |user|
  		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"] 
  			user.email = data["email"] if user.email.blank?
  			user.first_name,user.last_name = data["name"].split(' ') if user.first_name.blank? && user.last_name.blank?
  			user.date_of_birth = data["user_birthday"] if user.date_of_birth.blank?
  			user.image = session["devise.facebook_data"]["info"]["image"] if user.image.blank?
  			binding.pry
  		end
  	end
  end
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		user.password = Devise.friendly_token[0,20]
  		user.first_name = auth.info.first_name
  		user.image = auth.info.image
  	end
  end
end

