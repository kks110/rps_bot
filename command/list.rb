# frozen_string_literal: true

require_relative 'rps_register'
require_relative 'create_challenge'
require_relative 'accept_challenge'
require_relative 'see_challenges'
require_relative 'show_stats'

module Command
  LIST = [
    RPSRegister.new,
    CreateChallenge.new,
    AcceptChallenge.new,
    SeeChallenges.new,
    ShowStats.new
  ].freeze
end
