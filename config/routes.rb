Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :challenges, :only => [:create, :new, :show] do
    resources :tasks , :only => [:index, :create, :edit, :update, :destroy]
  end
  devise_for :users
end
