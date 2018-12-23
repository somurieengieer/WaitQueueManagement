Rails.application.routes.draw do
  resources :administrators
  resources :wait_queues
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
