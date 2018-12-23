Rails.application.routes.draw do
  resources :waiters
  resources :administrators
  resources :wait_queues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
