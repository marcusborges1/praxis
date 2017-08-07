Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users

  resources :users
  resources :sectors
  resources :projects
  resources :positions
  resources :questions
  resources :evaluations
  resources :evaluation_models
  resources :evaluation_cycles
  resources :answer_groups, only: [:edit, :update, :show]
end
