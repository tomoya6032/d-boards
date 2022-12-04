Rails.application.routes.draw do
  
  get '/' => 'toppage#index'

  resources :articles do
    resources :comments, only: [:new, :show, :edit, :create, :update, :destroy]
  end

  resources :information, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :chat, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :favorites, only: [:index]
  resource :profile, only: [:show, :edit, :update]
  
end
