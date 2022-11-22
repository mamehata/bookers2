Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get '/homes/about'=> 'homes#about', as: 'about'
  resources :books, only: [:show, :create, :index, :edit, :destroy]
  resources :users, only: [:show, :index, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
