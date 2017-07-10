Rails.application.routes.draw do
  resources :answer_groups
  resources :evaluations
  resources :evaluation_models
  root "welcome#index"  
  devise_for :users
  resources :positions
  resources :users
  resources :sectors
  resources :questions
  resources :evaluation_models
end
