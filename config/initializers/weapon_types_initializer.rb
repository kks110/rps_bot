# frozen_string_literal: true

class WeaponTypesInitializer
  WEAPON_TYPES = %w[rock paper scissors].freeze

  class << self
    def initialize_weapon_types
      puts 'Creating weapon types...'
      WEAPON_TYPES.each do |type|
        create_transaction_type(type) unless transaction_type_exists?(type)
      end
    end

    private

    def create_transaction_type(type)
      WeaponType.create!({ name: type })
    end

    def transaction_type_exists?(type)
      return false if WeaponType.find_by({ name: type }).nil?

      puts "Creating #{type}..."
      true
    end
  end
end
