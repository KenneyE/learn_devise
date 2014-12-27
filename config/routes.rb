Rails.application.routes.draw do
  devise_for :users
  devise_for :bets
  devise_scope :user do
    root to: "users#show"
  end
end
