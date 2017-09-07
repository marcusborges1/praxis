Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users

  resources :sectors
  resources :users
  resources :positions
  resources :questions
  resources :evaluations
  resources :evaluation_models
  resources :projects
  resources :answer_groups, only: [:edit, :update, :show]
  
  scope :users do
    get '/monitors/:id', to: 'users#monitors', as: :monitors
    patch '/add_monitors/:id', to: 'users#add_monitors', as: :add_monitors
  end
end
