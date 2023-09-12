Rails.application.routes.draw do
  resources :current_measurements, only: [:create, :index]
end
