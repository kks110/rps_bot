require_relative 'base'

module Command
  class ShowRegisteredPlayers < Command::Base
    def name
      :show_registered_players
    end

    def description
      'Show who has registered to play!'
    end

    def execute(request:)
      event = request.event

      players = Player.all

      mentions = ""

      players.each do |player|
        mentions << "<@#{player.discord_id}> "
      end

      event.respond(content: "Players registered are: #{mentions}", allowed_mentions: { parse: [] })
    end
  end
end
