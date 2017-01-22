Rails.application.routes.draw do
  resources :queued_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get '/' => 'users#new'
  resources :users
  get'/' => 'sessions#new'
  post'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post 'users/help'
  post 'users/finishHelping'
  get 'queued_users/help_screen' => 'queued_users#help_screen'


  end
