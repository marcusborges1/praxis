Rails.application.routes.draw do
  resources :options
  root "welcome#index"
  resources :positions
  resources :users
  resources :sectors
  resources :questions
end
