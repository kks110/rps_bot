require_relative './base'

module Command
  class CreateChallenge < Command::Base
    def name
      :challenge
    end

    def description
      "Challenge someone!"
    end

    def execute(request:)
      event = request.event

      weapon = WeaponType.find_by({ name: event.options['weapon'] })
      challenger = Player.find_by({ discord_id: event.user.id })
      challenged = Player.find_by({ discord_id: event.options['user'] })

      Challenge.create!(
        challenger: challenger,
        challenged: challenged,
        weapon: weapon
      )

      event.respond(content: "Challenge created!", ephemeral: true)
    end

    def options
      [
        Command::Options.new(
          type: 'user',
          name: 'user',
          description: 'The user you want the stats of (Default is yourself)',
          required: true,
        ),
        Command::Options.new(
          type: 'string',
          name: 'weapon',
          description: 'Pick your weapon',
          required: true,
          choices: {
            rock: 'rock',
            paper: 'paper',
            scissors: 'scissors',
          }
        )
      ]
    end
  end
end
