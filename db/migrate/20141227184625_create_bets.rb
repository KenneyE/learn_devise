class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :title, null: false
      t.string :premise, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
