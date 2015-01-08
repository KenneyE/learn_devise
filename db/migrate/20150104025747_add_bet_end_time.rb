class AddBetEndTime < ActiveRecord::Migration
  def change
    add_column :bets, :settle_time, :time, null: false, default: Time.new(2000)
  end
end
