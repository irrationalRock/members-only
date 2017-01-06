Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get    '/signup',   to: 'sessions#new'
  post   '/signup',   to: 'sessions#create'
  delete '/signup',  to: 'sessions#destroy'
  resources :posts, only: [:new, :create, :index]
end
