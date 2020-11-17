Rails.application.routes.draw do

  root to: 'home#top'
  get '/home/about', to: 'home#about', as: 'about'
  devise_for :users
  resources :users, only: [:index,:edit,:show,:update]
  resources :books, only: [:index,:edit,:show,:create,:update,:destroy]

end
