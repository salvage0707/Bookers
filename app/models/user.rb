class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # userがいいねしたbookを取得
  has_many :favorite_books, through: :favorites, source: :book

  validates :name, presence: true, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}
end
