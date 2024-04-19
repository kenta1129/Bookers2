Rails.application.routes.draw do
  
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: :about
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :books, only: [:new, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
