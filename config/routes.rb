Rails.application.routes.draw do
  devise_for :users
  resources :tours
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tour_app#index'
end
