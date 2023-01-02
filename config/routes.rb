Rails.application.routes.draw do
  
  devise_for :users
  # get '/' => 'toppage#index'
  
   root to: 'toppage#index'
  


  resources :articles do
    resources :comments, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  end

  resources :chats do
    resources :replys, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  end
  
  resources :informations 

  resources :lectures, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  
  resources :favorites, only: [:index]
  resource :profile, only: [:show, :edit, :update]
  
end
