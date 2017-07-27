class AccessController < ApplicationController
  
  before_action :authenticate_user!

  before_action :only_admin_allowed

  def index
    @users = User.where(:role => nil).page(params[:page]).per(2)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)
    @user.role = params[:role]
    respond_to do |format|
      binding.pry
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  def only_admin_allowed
    if current_user.admin?
        return true
    else
        flash[:notice]="You are not allowed to access this page."
        return false
    end
  end
end
