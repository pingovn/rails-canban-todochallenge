Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :challenges, :only => [:create, :new, :show] do
    resources :tasks, :only => [:index, :create, :edit, :update, :destroy]
    # resources :daily_tasks, :controller => 'tasks'
    # resources :weekly_tasks, :controller => 'tasks'
    # resources :monthly_tasks, :controller => 'tasks'
  end
  devise_for :users
end
