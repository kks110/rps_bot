# frozen_string_literal: true

module Command
  class Request
    def initialize(event:)
      @event = event
    end

    attr_reader :event, :game
  end
end
