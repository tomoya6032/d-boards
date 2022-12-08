Rails.application.routes.draw do
  
  # get '/' => 'toppage#index'
  root to: 'toppage#index'

  resources :articles do
    resources :comments, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  end

  resources :informations, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  resources :chats, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  resources :favorites, only: [:index]
  resource :profile, only: [:show, :edit, :update]
  
end
