# frozen_string_literal: true

module Command
  class Base
    def name
      raise NotImplementedError, 'Must Implement the name method for commands'
    end

    def description
      raise NotImplementedError, 'Must Implement the description method for commands'
    end

    def execute
      raise NotImplementedError, 'Must Implement the execute method for commands'
    end

    def options; end
  end
end
