Rails.application.routes.draw do
  devise_for :users
  resources :bets, only: [:create, :destroy, :update]
  post 'user_bets/:id', to: 'user_bets#create'
  get 'search', to: 'users#show'
  devise_scope :user do
    root to: "users#show", as: "user"
  end
end
