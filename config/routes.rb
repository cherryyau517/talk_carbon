Rails.application.routes.draw do
  resources :activity_types
  resources :activity_rankings
  resources :monthly_records
  resources :followings
  resources :comments
  resources :likes
  resources :activities_logs
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
