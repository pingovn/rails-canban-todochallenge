Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :challenges, :only => [:create, :new, :show]
  devise_for :users
end
