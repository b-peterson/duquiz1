Rails.application.routes.draw do
  devise_for :users
  root 'landing_page#index'
  resources :recipes
end
