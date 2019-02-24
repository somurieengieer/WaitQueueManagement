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
      get 'viewmode'
      post 'viewmodeoff'
    end
  end
  root 'top#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
