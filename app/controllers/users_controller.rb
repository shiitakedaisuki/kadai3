class UsersController < ApplicationController
  def top
  end
  
  def index
    @users = User.all
    @post_book = Book.new
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @post_book = Book.new
  end
  
  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end
  
  def update
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to post_images_path
      end
    @user = User.find(params[:id])
    if @user.update(user_params)#()の中にもストロングパラメーターを入れる
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:introduction, :name, :profile_image)#params.require(:モデルのファイル名)
  end
end
