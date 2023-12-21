class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.references :challenger, foreign_key: { to_table: 'players' }
      t.references :challenged, foreign_key: { to_table: 'players' }
      t.references :weapon_type, foreign_key: { to_table: 'weapon_types' }
    end
  end
end
