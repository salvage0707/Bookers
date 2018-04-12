class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  	@books = Book.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def create
  	book = current_user.books.new(book_params)
  	book.save
    flash[:notice] = "Book was successfully created."
  	redirect_to book_path(book.id)
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
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroy"
    redirect_to books_path
  end


  private

  	def book_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end


end
