class Bet < ActiveRecord::Base

  validates :title, :amount, :premise, :settle_time, presence: true
  before_validation :set_default_settle_time

  has_many :user_bets
  has_many :users, through: :user_bets

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  def self.search(query)
    self.where("premise like ? OR title like ?", "%#{query}%", "%#{query}%")
  end

  def self.get_recent(user_id, quantity)
    Bet.where.not(creator_id: user_id).order("updated_at DESC").limit(quantity)
  end

  def is_user?(current_user)
    self.users.include?(current_user) || self.creator == current_user
  end

  private
  def set_default_settle_time
      self.settle_time = Time.now.tomorrow if self.settle_time.past?
  end
end
