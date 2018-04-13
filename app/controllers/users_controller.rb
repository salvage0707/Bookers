class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_pages, only: [:edit]

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
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:user_update] = "User was successfully updated."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private

  	def books_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

    # 自分以外のプロフィール編集を制限
    def protect_pages
      user = User.find(params[:id])
      unless user == current_user
        flash[:alert] = "編集権限がありません"
        redirect_to user_path(current_user.id)
      end
    end
end
