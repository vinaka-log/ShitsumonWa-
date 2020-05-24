Rails.application.routes.draw do
  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/edit'
  root 'pages#index'
  get '/signup',  to: 'users#new'
  get '/login', to: 'user_sessions#new'
  post '/logout', to: 'user_sessions#destroy'

  
  resources :users do
    #sorceryでの認証のためルートを定義
    member do
      get :activate
    end
  end
  resources :user_sessions
  
  
  
end
