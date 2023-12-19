
module Helpers
  class StatsResponseBuilder
    attr_reader :player

    def initialize(player:)
      @player = player
    end

    def build_response
      "<@#{player.discord_id}>'s stats:\n" +
        "`───────────────────────────`\n" +
        ":medal:`│   W │   D │   L │ WR% `\n" +
        ":rock:`│#{score_display(player.rock_wins)}│#{score_display(player.rock_draws)}│#{score_display(player.rock_losses)}│#{score_display(player.rock_win_rate)}`\n" +
        ":scroll:`│#{score_display(player.paper_wins)}│#{score_display(player.paper_draws)}│#{score_display(player.paper_losses)}│#{score_display(player.paper_win_rate)}`\n" +
        ":scissors:`│#{score_display(player.scissors_wins)}│#{score_display(player.scissors_draws)}│#{score_display(player.scissors_losses)}│#{score_display(player.scissors_win_rate)}`\n" +
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
