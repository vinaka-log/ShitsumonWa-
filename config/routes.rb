Rails.application.routes.draw do
  
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  root 'pages#index'
  get '/signup',  to: 'users#new'
  get '/signup/registration',  to: 'users#registration'
  post '/signup/create',  to: 'users#create'
  get '/login', to: 'user_sessions#new'
  post '/login/pending', to: 'user_sessions#create'
  post '/logout', to: 'user_sessions#destroy'
  get 'search', to: 'questions#search'  
  resources :user_sessions, only: %i[new create destroy]
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
  resources :stocks, only: %i(index create destroy)

  post   '/like/:question_id', to: 'likes#like',   as: 'like'
  delete '/like/:question_id', to: 'likes#unlike', as: 'unlike'
  
end
