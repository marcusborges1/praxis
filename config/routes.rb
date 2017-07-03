Rails.application.routes.draw do
  root "welcome#index"  
  devise_for :users

  resources :positions
  resources :users
  resources :sectors
  resources :questions
  resources :evaluation_models
end
