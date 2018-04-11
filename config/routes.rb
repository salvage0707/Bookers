Rails.application.routes.draw do

  devise_for :users
  root to: 'books#top'

  resources :books
end
