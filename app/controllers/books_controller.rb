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
    redirect_to book_path(@post_book.id)#booksのshow画面に飛ぶ
  end
  
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト 
  end
  
  # 投稿データのストロングパラメータ
  private

  def post_book_params
    params.require(:book).permit(:title, :body)#params.require(:モデルのファイル名)
  end
  
  
end
