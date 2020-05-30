Rails.application.routes.draw do
  
  root 'pages#index'
  get '/signup',  to: 'users#new'
  get '/login', to: 'user_sessions#new'
  post '/logout', to: 'user_sessions#destroy'
  
  resources :user_sessions
  resources :questions
  resources :users do
    #sorceryでの認証のためルートを定義
    member do
      get :activate
    end
  end
  
  
  
  
end
