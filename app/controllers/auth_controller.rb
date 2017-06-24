class AuthController < ApplicationController
  before_action :authenticate_user! 
  def login
  		if(user_signed_in?)
  			@a="The User is Currently Logged in!"
  		else
  			@a="Fuck U bastard!!"
  		end
  		@b=user_session
  end
end
