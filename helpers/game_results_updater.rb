# frozen_string_literal: true

require_relative 'game_logic'

module Helpers
  class GameResultsUpdater
    attr_reader :challenger, :challenged, :challenger_weapon, :challenged_weapon, :winner, :global_stats

    def initialize(challenger:, challenged:, challenger_weapon:, challenged_weapon:)
      @challenger = challenger
      @challenged = challenged
      @challenger_weapon = challenger_weapon
      @challenged_weapon = challenged_weapon
      @winner = determine_winner
      @global_stats = GlobalStats.first
    end

    def update_results
      case winner
      when :draw then update_draws
      when :challenger then update_challenger_wins
      when :challenged then update_challenged_wins
      end
      winner
    end

    private

    def determine_winner
      Helpers::GameLogic.new.determine_winner(challenger_weapon: challenger_weapon, challenged_weapon: challenged_weapon)
    end

    def update_draws
      update_counts(challenger, "#{challenger_weapon.name}_draws")
      update_counts(challenged, "#{challenged_weapon.name}_draws")
    end

    def update_challenger_wins
      update_counts(challenger, "#{challenger_weapon.name}_wins")
      update_counts(challenged, "#{challenged_weapon.name}_losses")
    end

    def update_challenged_wins
      update_counts(challenger, "#{challenger_weapon.name}_losses")
      update_counts(challenged, "#{challenged_weapon.name}_wins")
    end

    def update_counts(participant, key)
      participant.update!({ key.to_sym => participant.send(key) + 1 })
      global_stats.update!({ key.to_sym => global_stats.send(key) + 1 })
    end
  end
end
