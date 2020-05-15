Rails.application.routes.draw do
  root 'pages#test'
  get 'pages/show'
  get  '/signup',  to: 'users#new'
end
