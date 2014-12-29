class Bet < ActiveRecord::Base

  validates :title, :amount, :premise, presence: true

  has_many :user_bets
  has_many :users, through: :user_bets

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  def self.search(query)
    where("premise like ?", "%#{query}%")
  end

end
