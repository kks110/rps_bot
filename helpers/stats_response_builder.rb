
module Helpers
  class StatsResponseBuilder
    attr_reader :stats

    def initialize(stats:)
      @stats = stats
    end

    def build_player_response
      "<@#{stats.discord_id}>'s stats:\n" +
        "`───────────────────────────`\n" +
        ":medal:`│   W │   D │   L │ WR% `\n" +
        ":rock:`│#{score_display(stats.rock_wins)}│#{score_display(stats.rock_draws)}│#{score_display(stats.rock_losses)}│#{score_display(stats.rock_win_rate)}`\n" +
        ":scroll:`│#{score_display(stats.paper_wins)}│#{score_display(stats.paper_draws)}│#{score_display(stats.paper_losses)}│#{score_display(stats.paper_win_rate)}`\n" +
        ":scissors:`│#{score_display(stats.scissors_wins)}│#{score_display(stats.scissors_draws)}│#{score_display(stats.scissors_losses)}│#{score_display(stats.scissors_win_rate)}`\n" +
        "`───────────────────────────`"
    end

    def build_global_response
      "Global stats:\n" +
        "`───────────────────────────`\n" +
        ":medal:`│   W │   D │   L │ WR% `\n" +
        ":rock:`│#{score_display(stats.rock_wins)}│#{score_display(stats.rock_draws)}│#{score_display(stats.rock_losses)}│#{score_display(stats.rock_win_rate)}`\n" +
        ":scroll:`│#{score_display(stats.paper_wins)}│#{score_display(stats.paper_draws)}│#{score_display(stats.paper_losses)}│#{score_display(stats.paper_win_rate)}`\n" +
        ":scissors:`│#{score_display(stats.scissors_wins)}│#{score_display(stats.scissors_draws)}│#{score_display(stats.scissors_losses)}│#{score_display(stats.scissors_win_rate)}`\n" +
        "`───────────────────────────`"
    end

    private

    def score_display(score)
      display_response = ""
      score_length = score.to_s.length

      if score_length == 1
        display_response << "   #{score} "
      elsif score_length == 2
        display_response << "  #{score} "
      else
        display_response << " #{score} "
      end
    end
  end
end
