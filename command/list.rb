# frozen_string_literal: true

require_relative 'rps_help'
require_relative 'rps_register'
require_relative 'create_challenge'
require_relative 'accept_challenge'
require_relative 'see_challenges'
require_relative 'show_stats'
require_relative 'show_global_stats'
require_relative 'show_registered_players'

module Command
  LIST = [
    RPSHelp.new,
    RPSRegister.new,
    CreateChallenge.new,
    AcceptChallenge.new,
    SeeChallenges.new,
    ShowStats.new,
    ShowGlobalStats.new,
    ShowRegisteredPlayers.new
  ].freeze
end
