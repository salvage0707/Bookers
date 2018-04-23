Rails.application.routes.draw do

	root to: 'pages#top'

	# pagesコントローラー
  get 'home/about' => 'pages#about', as: 'about'
  get 'home'			 => 'pages#top',	 as: 'top'

  # deviseコントローラー
  devise_for :users
  #booksコントローラー
  resources :books do
    # bookに関連づいたfavorites
    resource :favorites, only: [:create, :destroy]
  end
  #usersコントローラー
  resources :users, only: [:show, :index, :edit, :update] do
    # userに関連づいたfavorites
    resources :favorites, only: [:index]
  end
end
