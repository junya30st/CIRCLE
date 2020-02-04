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
  resources :categories
  resources :relationships, only: [:create, :destroy]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  # mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end