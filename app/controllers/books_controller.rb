class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :only_made_user, only: [:edit, :destroy, :update]

  def index
  	@books = Book.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def create
  	@book = current_user.books.new(book_params)
    if @book.save
      flash[:book_create] = "Book was successfully created."
    	redirect_to books_path
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render 'index'
    end
  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:book_update] = "Book was successfully updated."
    redirect_to book_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:book_destroy] = "Book was successfully destroy"
    redirect_to books_path
  end


  private

  	def book_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end

    # 投稿ユーザー以外に使用制限
    def only_made_user
      book = Book.find(params[:id])
      unless book.user == current_user
        redirect_to user_path(current_user.id)
      end
    end


end
