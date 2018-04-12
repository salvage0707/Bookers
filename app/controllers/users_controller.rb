class UsersController < ApplicationController
  before_action :authenticate_user!

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  	def books_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
