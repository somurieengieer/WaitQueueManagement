Rails.application.routes.draw do
#  get 'sessions/new'
  resources :waiters do
    member do
      patch 'skip'
      patch 'done'
    end
  end
  resources :administrators
  resources :wait_queues do
    member do
      patch 'countup'
      patch 'reset'
    end
  end
  root 'top#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
