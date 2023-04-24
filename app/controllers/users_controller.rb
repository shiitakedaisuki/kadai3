class UsersController < ApplicationController
  def top
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    redirect_to user_path(user.id)
  end
end
