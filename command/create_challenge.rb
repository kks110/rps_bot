# frozen_string_literal: true

require_relative 'base'

module Command
  class CreateChallenge < Command::Base
    def name
      :create_challenge
    end

    def description
      'Challenge someone!'
    end

    def execute(request:)
      event = request.event

      challenger_id = event.user.id
      challenged_id = event.options['user'].to_i

      weapon = WeaponType.find_by(name: event.options['weapon'])
      challenger = Player.find_by(discord_id: challenger_id)
      challenged = Player.find_by(discord_id: challenged_id)

      if challenger.nil?
        event.respond(content: "You have not registered so you can't challenge someone", ephemeral: true)
        return
      end

      if challenged.nil?
        event.respond(content: "<@#{challenged_id}> has not registered to play")
        return
      end

      if challenger_id == challenged_id
        event.respond(content: "You can't challenge yourself", ephemeral: true)
        return
      end

      if Challenge.find_by(challenger: challenger, challenged: challenged) ||
        Challenge.find_by(challenger: challenged, challenged: challenger)
        event.respond(content: 'A challenge already exists!', ephemeral: true)
        return
      end

      Challenge.create!(
        challenger: challenger,
        challenged: challenged,
        weapon_type: weapon
      )

      event.respond(content: "<@#{challenger_id}> has challenged <@#{challenged_id}> to some Rock Paper Scissors")
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
