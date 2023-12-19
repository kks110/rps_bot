require_relative 'base'
require_relative '../helpers/stats_response_builder'

module Command
  class ShowStats < Command::Base
    def name
      :show_stats
    end

    def description
      "See a players all time stats, default is yourself if no username given"
    end

    def execute(request:)
      event = request.event

      user_id = event.options['user']
      user_id = event.user.id if user_id.nil?

      player = Player.find_by({discord_id: user_id.to_i})

      response = Helpers::StatsResponseBuilder.new(stats: player).build_player_response

      event.respond(content: response, allowed_mentions: {"parse": []})
    end

    def options
      [
        Command::Options.new(
          type: 'user',
          name: 'user',
          description: 'The user you want the stats of. (Default is yourself)',
          required: false,
          )
      ]
    end
  end
end
