Rails.application.routes.draw do
  get 'users/top'
  get 'books/top'
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end