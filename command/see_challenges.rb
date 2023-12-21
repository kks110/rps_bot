require_relative 'base'

module Command
  class SeeChallenges < Command::Base
    def name
      :see_challenges
    end

    def description
      'See your game challenges!'
    end

    def execute(request:)
      event = request.event
      user = event.user
      player = Player.find_by(discord_id: user.id)

      people_you_have_challenged = Challenge.where(challenger: player)
      people_who_have_challenged_you = Challenge.where(challenged: player)

      event.respond(
        content: "#{build_your_sent_challenges(challenges: people_you_have_challenged)} #{build_your_received_challenges(challenges: people_who_have_challenged_you)}",
        ephemeral: true
      )
    end

    def build_your_sent_challenges(challenges:)
      response = "You have challenged:\n"
      return response if challenges.nil?

      challenges.each do |challenge|
        response << "<@#{challenge.challenged.discord_id}>\n"
      end
      response
    end

    def build_your_received_challenges(challenges:)
      response = "You have challenges from:\n"
      return response if challenges.nil?

      challenges.each do |challenge|
        response << "<@#{challenge.challenger.discord_id}>\n"
      end
      response
    end
  end
end
