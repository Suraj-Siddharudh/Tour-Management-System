Rails.application.routes.draw do
  resources :bookmarks
  resources :bookings
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: "users/registrations"}
  resources :tours
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # Custom Routes for Users
    match '/user/new', to: 'users#new', via: 'get'
    match '/user/create', to: 'users#create', via: 'post'
    match '/user/:id/edit', to: 'users#edit', via: 'get', as: 'user_edit'
    match '/user/:id', to: 'users#update', via: 'put'
    match '/user/:id', to: 'users#update', via: 'patch'
    match '/user/:id', to: 'users#destroy', via: 'delete'
  
    match '/users', to: 'users#index', via: 'get'
    match '/users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  match '/agents', to: 'users#agent', via: 'get'
  match '/customers', to: 'users#customer', via: 'get'
  match '/tour/search' => 'tours#new_search', :via => 'get', :as => 'new_tour_search'
  match '/tour/search' => 'tours#search', :via => 'post', :as=> 'tour_search'
  root to: 'tour_app#index'

end
