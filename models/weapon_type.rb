# frozen_string_literal: true

require 'active_record'

class WeaponType < ActiveRecord::Base
  validates :name, inclusion: { in: %w[rock paper scissors], message: 'Must be addition or deduction' }
  validates :name, presence: true, uniqueness: true
end
