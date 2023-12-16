# frozen_string_literal: true

class WeaponType
  include Mongoid::Document
  field :name, type: String

  validates :name, inclusion: { in: %w[rock paper scissors], message: "Must be addition or deduction" }
  validates :name, presence: true, uniqueness: true
end
