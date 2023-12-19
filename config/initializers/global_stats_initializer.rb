# frozen_string_literal: true

class GlobalStatsInitializer
  class << self
    def initialize_global_stats
      puts 'Creating global stats...'

      if GlobalStats.count.zero?
        GlobalStats.create!
        puts 'Done!'
      else
        puts 'Already created, skipping...'
      end
    end
  end
end
