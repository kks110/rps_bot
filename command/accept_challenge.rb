# frozen_string_literal: true

require_relative 'base'
require_relative '../helpers/game_results_updater'

module Command
  class AcceptChallenge < Command::Base
    def name
      :accept_challenge
    end

    def description
      'Accept a challenge!'
    end

    def execute(request:)
      event = request.event

      challenged_id = event.user.id
      challenger_id = event.options['user'].to_i

      challenged_weapon = WeaponType.find_by({ name: event.options['weapon'] })
      challenger = Player.find_by({ discord_id: challenger_id })
      challenged = Player.find_by({ discord_id: challenged_id })

      challenge =  Challenge.find_by({ challenger: challenger, challenged: challenged }) ||
        Challenge.find_by({ challenger: challenged, challenged: challenger })

      if challenge.nil?
        event.respond(content: 'No challenge between you exists', ephemeral: true)
        return
      end

      challenger_weapon = challenge.weapon

      winner = Helpers::GameResultsUpdater.new(
        challenger: challenger,
        challenged: challenged,
        challenger_weapon: challenger_weapon,
        challenged_weapon: challenged_weapon
      ).update_results

      case winner
      when :draw
        event.respond(content: "<@#{challenger_id}> and <@#{challenged_id}> both picked #{challenged_weapon.name}. Its a draw!")
      when :challenger
        event.respond(content: "<@#{challenged_id}> picked #{challenged_weapon.name}, <@#{challenger_id}> picked #{challenger_weapon.name}. <@#{challenger_id}> has won!")
      when :challenged
        event.respond(content: "<@#{challenged_id}> picked #{challenged_weapon.name}, <@#{challenger_id}> picked #{challenger_weapon.name}. <@#{challenged_id}> has won!")
      end

      challenge.destroy
    end

    def options
      [
        Command::Options.new(
          type: 'user',
          name: 'user',
          description: 'The user you want to challenge',
          required: true
        ),
        Command::Options.new(
          type: 'string',
          name: 'weapon',
          description: 'Pick your weapon',
          required: true,
          choices: {
            rock: 'rock',
            paper: 'paper',
            scissors: 'scissors'
          }
        )
      ]
    end
  end
end
