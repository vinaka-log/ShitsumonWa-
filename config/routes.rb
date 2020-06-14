Rails.application.routes.draw do
  
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  root 'pages#index'
  get '/signup',  to: 'users#new'
  get '/login', to: 'user_sessions#new'
  post '/logout', to: 'user_sessions#destroy'
  
  resources :user_sessions
  resources :password_resets, only: %i[create edit update]
  resources :questions do
    resources :comments,only: %i[new create destroy]
  end

  resources :relationships, only: %i[create destroy]
  resources :users do
    member do
      get :activate, :following, :followers
    end
  end

  post   '/like/:question_id', to: 'likes#like',   as: 'like'
  delete '/like/:question_id', to: 'likes#unlike', as: 'unlike'
  
end
