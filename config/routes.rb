Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  get  '/signup',  to: 'users#new'

  resources :users
  resources :users_sessions

  get '/login' to: 'user_sessions#new'
  post '/logout' to: 'user_sessions#destroy'

 
end
