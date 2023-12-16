# frozen_string_literal: true

class WeaponTypesInitializer
  WEAPON_TYPES = %w[rock paper scissors]

  def self.initialize_weapon_types
    WEAPON_TYPES.each do |type|
      create_transaction_type(type) unless transaction_type_exists?(type)
    end
  end

  private
  # This creates the transaction types bases on what is passed in to it.
  def self.create_transaction_type(type)
    WeaponType.create!({ name: type })
  end

  # This checks if the transaction type already exists based on the type passed in.
  def self.transaction_type_exists?(type)
    return false if WeaponType.find_by({ name: type }).nil?
    true
  end
end
