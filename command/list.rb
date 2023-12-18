# frozen_string_literal: true

require_relative 'rps_register'
require_relative 'create_challenge'
require_relative 'accept_challenge'

module Command
  LIST = [
    RPSRegister.new,
    CreateChallenge.new,
    AcceptChallenge.new
  ].freeze
end
