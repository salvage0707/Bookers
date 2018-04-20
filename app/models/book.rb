class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy

	validates :body, presence: true, length: {maximum: 200}
	validates :title, presence: true

		# ログインユーザーが投稿いいねしているかを確認する
		def has_favorite(user_id)
			favorites.find_by(user_id: user_id)
		end
end
