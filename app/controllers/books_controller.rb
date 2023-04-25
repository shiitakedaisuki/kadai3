class BooksController < ApplicationController
  def top
  end
  
  def new
    @post_book = Book.new
  end
  
  # 投稿データの保存
  def create
    @post_book = Book.new(post_book_params)#()の中にもストロングパラメーターを入れる。脆弱性を補う
    @post_book.user_id = current_user.id
    if @post_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@post_book.id)#booksのshow画面に飛ぶ
    else
      @books = Book.all
      @user = current_user
      render :index #(render :の後はアクション名を入れる)
    end
  end
  
  def index
    @books = Book.all
    @post_book = Book.new
    @user = current_user
  end
  
  def show
    @post_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
      if @book.user == current_user
        render "edit"
      else
        redirect_to books_path
      end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(post_book_params)#()の中にもストロングパラメーターを入れる
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit #(render :の後はアクション名を入れる)
    end
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
