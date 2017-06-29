Rails.application.routes.draw do
  resources :evaluations
  resources :evaluation_models
  root "welcome#index"
  resources :positions
  resources :users
  resources :sectors
  resources :questions
end
