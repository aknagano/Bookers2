Rails.application.routes.draw do
  
  get '/home/about' => 'homes#about' ,as: "about"
  
  # get 'users/show'
  # get 'users/edit'
  devise_for :users
  resources :users, only: [:show, :edit, :index, :update]
  
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  
  # get 'homes/top'
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
