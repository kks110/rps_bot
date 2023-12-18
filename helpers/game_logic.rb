
module Helpers
  class GameLogic
    def determine_winner(challenger_weapon:, challenged_weapon:)
      result_for_challenger = pairings[challenger_weapon.name.to_sym][challenged_weapon.name.to_sym]

      return :draw if result_for_challenger == :draw
      result_for_challenger == :win ? :challenger : :challenged
    end

    private

    def pairings
      {
        rock: {
          rock: :draw,
          paper: :lose,
          scissors: :win
        },
        paper: {
          rock: :win,
          paper: :draw,
          scissors: :lose
        },
        scissors: {
          rock: :lose,
          paper: :win,
          scissors: :draw
        }
      }
    end
  end
end
