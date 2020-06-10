Rails.application.routes.draw do
  resources :orders
  devise_for :users
  root to: 'static#homepage'
end
