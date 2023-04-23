Rails.application.routes.draw do
  get 'users/top'
  get 'books/top'
  devise_for :users#usersコントローラの中にdeviceを適用するという意味
  root to: "homes#top"
  get 'homes/about'=> 'homes#about', as: 'about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end