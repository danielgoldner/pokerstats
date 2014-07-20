class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :played
      t.integer :buyin
      t.integer :winnings
      t.integer :profit
      t.string :gametype

      t.timestamps
    end
  end
end
