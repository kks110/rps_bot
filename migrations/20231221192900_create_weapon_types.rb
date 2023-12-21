class CreateWeaponTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_types do |t|
      t.text :name, null: false
    end
  end
end
