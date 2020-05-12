Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  get  '/signup',  to: 'users#new'
end
