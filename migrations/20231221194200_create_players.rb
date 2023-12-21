class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.bigint :discord_id, null: false
      t.text :username, null: false
      t.integer :rock_wins, default: 0
      t.integer :rock_losses, default: 0
      t.integer :rock_draws, default: 0
      t.integer :paper_wins, default: 0
      t.integer :paper_losses, default: 0
      t.integer :paper_draws, default: 0
      t.integer :scissors_wins, default: 0
      t.integer :scissors_losses, default: 0
      t.integer :scissors_draws, default: 0
    end
  end
end
