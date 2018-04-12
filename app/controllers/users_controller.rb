class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = @user.books.all
  	@book = Book.new
  end

  def index
  	@user = User.find(current_user.id)
  	@users = User.all
  	@book = Book.new
  end

  private

  	def books_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end
end
