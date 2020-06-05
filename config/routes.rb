Rails.application.routes.draw do
  
  root 'pages#index'
  get '/signup',  to: 'users#new'
  get '/login', to: 'user_sessions#new'
  post '/logout', to: 'user_sessions#destroy'
  
  resources :user_sessions
  resources :questions do
    resources :comments,only: [:new, :create, :destroy]
  end


  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :activate, :following, :followers
    end
  end
  

  post '/likes', to: 'likes#create', as: 'like'
  delete '/likes', to: 'likes#destroy', as: 'unlike'

  post   '/like/:question_id', to: 'likes#like',   as: 'like'
  delete '/like/:question_id', to: 'likes#unlike', as: 'unlike'
  
  
  
  
  
end
