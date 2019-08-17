class BooksController < ApplicationController

  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	# ストロングパラメーターを使用
  # ↓ローカル変数↓モデル,メソッド↓アクション名？
    book = Book.new(book_params)
    # DBへ保存する

    book.save
    # 詳細画面へリダイレクト
    redirect_to book_path(book.id)
    flash[:notice] = "Book was successfully created."

  end

  def show
  	 @book = Book.find(params[:id])
  end

  def edit
  	 @book = Book.find(params[:id])
  end

  def update
  	 book = Book.find(params[:id])
     book.update(book_params)
     redirect_to book_path(book.id)
     flash[:notice] = "Book was successfully updated."
  end

  def destroy
  	book = Book.find(params[:id]) #データ(レコード)を1件取得
    book.destroy #データ（レコード）を削除
    redirect_to books_path #メイン画面へリダイレクト
     flash[:notice] = "Book was successfully destroyed."
  end

  private
  # メソッドの名前はモデル名_paramsとすることが多い
  def book_params
  	#  params.require(:モデル名).permit(:カラム名1, :カラム名2, ...)
  	params.require(:book).permit(:title, :body)
  end
end
