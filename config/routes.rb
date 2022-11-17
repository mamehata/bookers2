Rails.application.routes.draw do
  get 'users/edit'
  get 'books/index'
  get 'books/edit'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
