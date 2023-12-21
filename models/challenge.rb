# frozen_string_literal: true

require 'active_record'

class Challenge < ActiveRecord::Base

  belongs_to :challenger, class_name: 'Player', foreign_key: 'challenger_id'
  belongs_to :challenged, class_name: 'Player', foreign_key: 'challenged_id'
  belongs_to :weapon_type, class_name: 'WeaponType', foreign_key: 'weapon_type_id'

  validates :challenger, :challenged, :weapon_type, presence: true
end
