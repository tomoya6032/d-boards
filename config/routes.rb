Rails.application.routes.draw do
  
  devise_for :users
  
  
   root to: 'toppage#index'
   resource :timeline, only: [:show]


  resources :articles do
    resources :comments, only: [:index, :new, :show, :edit, :create, :update, :destroy]
    resource :like, only: [:show, :create, :destroy]

  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end


  resources :chats do
    resources :replys, only: [:index, :new, :show, :edit, :create, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :informations do
    resource :like, only: [:create, :destroy]
  end
  
  resources :lectures, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  
  resources :favorites, only: [:index]
  resource :profile, only: [:show, :edit, :update]
  
end
