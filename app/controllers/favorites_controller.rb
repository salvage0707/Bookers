class FavoritesController < ApplicationController
	before_action :call_models, only: [:create, :destroy]

	def create
		@favorite = Favorite.create(user_id: current_user.id, book_id: params[:book_id])
	end

	def destroy
		@favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
		@favorite.destroy
	end

	def index
		@user = User.find(params[:user_id])
		@favorite_books = @user.favorite_books
		@book = Book.new
	end

	private

		def call_models
			@book = Book.find(params[:book_id])
		end
end
