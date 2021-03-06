class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_bets
  has_many :bets, through: :user_bets
  has_many :created_bets, class_name: "Bet", foreign_key: "creator_id"

end
