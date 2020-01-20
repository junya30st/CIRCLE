Rails.application.routes.draw do
  devise_for :users
  root 'messages#show'
  resources :groups
  resources :posts do
    collection do
      post 'user'
    end
  end
  resources :users
  resources :categories, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  resources :messages
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end