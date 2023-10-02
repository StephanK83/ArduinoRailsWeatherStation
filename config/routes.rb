Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  resources :current_measurements, only: [:create, :index]
end
