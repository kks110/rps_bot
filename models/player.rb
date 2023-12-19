# frozen_string_literal: true

class Player
  include Mongoid::Document
  field :discord_id, type: Integer

  field :username, type: String

  field :rock_wins, type: Integer, default: 0
  field :rock_losses, type: Integer, default: 0
  field :rock_draws, type: Integer, default: 0
  field :paper_wins, type: Integer, default: 0
  field :paper_losses, type: Integer, default: 0
  field :paper_draws, type: Integer, default: 0
  field :scissors_wins, type: Integer, default: 0
  field :scissors_losses, type: Integer, default: 0
  field :scissors_draws, type: Integer, default: 0

  validates :discord_id, :username, presence: true

  def rock_win_rate
    return 0 if total_rock_games.zero?

    (((rock_wins + draw_wr_adjustment(rock_draws)) / total_rock_games) * 100).round
  end

  def paper_win_rate
    return 0 if total_paper_games.zero?

    (((paper_wins + draw_wr_adjustment(paper_draws)) / total_paper_games) * 100).round
  end

  def scissors_win_rate
    return 0 if total_scissors_games.zero?

    (((scissors_wins + draw_wr_adjustment(scissors_draws)) / total_scissors_games) * 100).round
  end

  private

  def total_rock_games
    rock_wins + rock_losses + rock_draws
  end

  def total_paper_games
    paper_wins + paper_losses + paper_draws
  end

  def total_scissors_games
    scissors_wins + scissors_losses + scissors_draws
  end

  def draw_wr_adjustment(draw_score)
    draw_score * 0.5
  end
end
