class AddBetEndTime < ActiveRecord::Migration
  def change
    add_column :bets, :settle_time, :time, null: false , default: Time.now.tomorrow
  end
end
