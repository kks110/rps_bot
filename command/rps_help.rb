require_relative 'base'
require_relative 'list'

module Command
  class RPSHelp < Command::Base
    def name
      :rps_help
    end

    def description
      'Show a list of commands'
    end

    def execute(request:)
      event = request.event

      response = "Here is a list of commands:\n"

      Command::Helpers::LIST.each do |command|
        response << "- `/#{command.name}`: #{command.description}\n"
      end

      event.respond(content: response, ephemeral: true)
    end
  end
end
