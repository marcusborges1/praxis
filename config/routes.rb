Rails.application.routes.draw do
  root "welcome#index"
  resources :positions
  resources :users
  resources :sectors
  resources :questions
  resources :options
end
