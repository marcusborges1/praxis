Rails.application.routes.draw do
  root "welcome#index"
  
  devise_for :users

  resources :positions
  resources :users
  resources :sectors
  resources :questions
end
