Rails.application.routes.draw do
  devise_for :users
  resources :bets
  post 'user_bets/:id', to: 'user_bets#create'
  devise_scope :user do
    root to: "users#show", as: "user"
  end
end
