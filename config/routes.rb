Estimator::Application.routes.draw do
  resources :projects

  resources :homes

  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

  resources :sessions
  resources :users
  resources :dashboards

  root :to => "homes#index"

  # See how all your routes lay out with "rake routes"

end
