Rails.application.routes.draw do

	root to: 'pages#top'

	# pagesコントローラー
  get 'home/about' => 'pages#about', as: 'about'
  get 'home'			 => 'pages#top',	 as: 'top'

  # deviseコントローラー
  devise_for :users
  #booksコントローラー
  resources :books
  #usersコントローラー
  resources :users, only: [:show, :index, :edit, :update]
end
