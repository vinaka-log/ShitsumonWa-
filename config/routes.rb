Rails.application.routes.draw do
  root 'pages#test'
  get 'pages/show'
  get  '/signup',  to: 'users#new'

  resources :users do
    #sorceryでの認証のためルートを定義
    member do
      get :activate
    end
  end
  resources :users_sessions
  
  
  get '/login', to: 'user_sessions#new'
  post '/logout', to: 'user_sessions#destroy'

 
end
