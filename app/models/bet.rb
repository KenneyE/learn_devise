class Bet < ActiveRecord::Base

  validates :title, :amount, :premise, presence: true

  has_many :user_bets
  has_many :users, through: :user_bets
end
