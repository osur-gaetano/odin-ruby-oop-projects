# frozen_string_literal: false

# Contains every class about the mastermind game
module Mastermind
  # Player class
  class Player
    attr_accessor :role, code

    def initialize(name, role)
      @name = name
      @role = role
      @points = 0
      @code = [nil, nil, nil, nil]
    end

    def change_role(new_role)
      @role = new_role
    end

    def make_code(code_maker_code)
      @code = code_maker_code
    end

    def self.random_computer_name
      %w[Jarvis Ultron Siri].sample
    end

    def self.create_player(name)
      role = 'code_maker'
      Player.new(name, role)
    end
  end
end
