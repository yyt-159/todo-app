Rails.application.routes.draw do
  get 'users/new', to: 'users#new'
  get 'users/index', to: 'users#index'
  post 'users/new', to: 'users#create'
  get 'users/:id/edit', to: 'users#edit'
  post 'users/:id/update', to: 'users#update'
  delete 'users/:id/destroy', to: 'users#destroy'
  get 'users/:id/show', to:'users#show' 

  root 'home#index'

  resources :tasks

  get 'session/new'
  get  'login',   to: 'session#new'
  post  'login',   to: 'session#create'
  delete  'logout',  to: 'session#destroy'
end
