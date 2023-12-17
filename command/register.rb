require_relative './base'

module Command
  class Register < Command::Base
    def name
      :register
    end

    def description
      "Register to play!"
    end

    def execute(request:)
      event = request.event

      if Player.find_by({ discord_id: event.user.id })
        event.respond(content: "You have already registered!", ephemeral: true)
        return
      end

      user = event.user
      Player.create!(
        discord_id: user.id,
        username: user.username,
      )

      event.respond(content: "You registered successfully!", ephemeral: true)
    end
  end
end
