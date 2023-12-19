require_relative 'base'
require_relative '../helpers/stats_response_builder'

module Command
  class ShowGlobalStats < Command::Base
    def name
      :show_global_stats
    end

    def description
      "See all time stats"
    end

    def execute(request:)
      event = request.event

      stats = GlobalStats.first

      response = Helpers::StatsResponseBuilder.new(stats: stats).build_global_response

      event.respond(content: response)
    end
  end
end
