Estimator::Application.routes.draw do
  
  resources :subdivisions

  resources :divisions

  get  '/admin' => 'admins#index', :as => :admin 

  resources :materials

  resources :wall_layers

  resources :walltypes

  resources :line_items

  resources :takeoffs

  resources :projects

  resources :homes

  match 'user/show' => 'users#show', :as => :my_info
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
