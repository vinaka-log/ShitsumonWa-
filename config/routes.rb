Rails.application.routes.draw do
  get 'pages/show'
  get  '/signup',  to: 'users#new'
end
