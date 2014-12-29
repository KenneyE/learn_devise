class AddBetCreator < ActiveRecord::Migration
  def change
    add_column :bets, :creator_id, :integer
  end
end
