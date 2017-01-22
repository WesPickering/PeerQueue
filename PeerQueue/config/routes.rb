Rails.application.routes.draw do
  resources :queued_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup' => 'users#new'
  resources :users
  get'login' => 'sessions#new'
  post'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'help_queued_user' => 'users#help'
end
