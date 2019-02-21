Rails.application.routes.draw do
  devise_for :users
  resources :tours
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # Custom Routes for Users
    match '/user/new', to: 'users#new', via: 'get'
    match '/user/create', to: 'users#create', via: 'post'
    match '/user/:id/edit', to: 'users#edit', via: 'get'
    match '/user/:id', to: 'users#update', via: 'put'
    match '/user/:id', to: 'users#update', via: 'patch'
    match '/user/:id', to: 'users#destroy', via: 'delete'
  
  match '/users', to: 'users#index', via: 'get'
  root to: 'tour_app#index'
end
