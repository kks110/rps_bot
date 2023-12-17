# frozen_string_literal: true

class Challenge
  include Mongoid::Document

  belongs_to :challenger, class_name: 'Player'
  belongs_to :challenged, class_name: 'Player'
  belongs_to :weapon, class_name: 'WeaponType'

  validates :challenger, :challenged, :weapon, presence: true
end
