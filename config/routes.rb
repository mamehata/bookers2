Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:index, :edit]
  resources :users, only: [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
