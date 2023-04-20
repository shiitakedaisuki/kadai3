class BooksController < ApplicationController
  def top
  end
  
  def new
    @post_book = Book.new
  end
  
  # 投稿データの保存
  def create
    @post_book = Book.new(post_book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to root_path#books/useridに飛ぶようにする？？
  end
  
  # 投稿データのストロングパラメータ
  private

  def post_book_params
    params.require(:book).permit(:book_name, :caption)#params.require(:モデルのファイル名)
  end
  
  
end
