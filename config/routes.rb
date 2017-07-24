Rails.application.routes.draw do
  get 'answer_groups/edit'

  get 'answer_groups/update'

  get 'answer_group/edit'

  get 'answer_group/update'

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
