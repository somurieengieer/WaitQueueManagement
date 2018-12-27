Rails.application.routes.draw do
#  get 'sessions/new'
  resources :waiters
  resources :administrators
  resources :wait_queues do
    member do
      patch 'countup'
    end
  end
  root 'top#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
