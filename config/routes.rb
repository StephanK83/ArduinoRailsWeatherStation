Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  get 'about', to: 'about#index', as: 'about'
  get 'arduino_code', to: 'arduino_code#index', as: 'arduino_code'
  get 'arduino_setup', to: 'arduino_setup#index', as: 'arduino_setup'
  get 'forecast', to: 'forecast#index', as: 'forecast'
  get 'review', to: 'review#index', as: 'review'
  resources :current_measurements, only: [:create, :index]
end
