require_relative './register'
require_relative './create_challenge'

module Command
  LIST = [
    Register.new,
    CreateChallenge.new
  ]
end
