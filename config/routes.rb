Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users
  resources :groups do
    resources :messages
  end
  mount ActionCable.server => '/cable'
  resources :posts do
    collection do
      post 'user'
    end
  end
  resources :categories, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  # mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end