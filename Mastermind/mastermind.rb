# frozen_string_literal: false

# Contains every class about the mastermind game
module Mastermind
  # Player class
  class Player
    attr_accessor :role, :code, :points, :name

    def initialize(name, role)
      @name = name
      @role = role
      @points = 0
      @code = Array.new(4, nil)
    end

    def change_role(new_role)
      @role = new_role
    end

    def make_code(new_code)
      @code = new_code
    end

    def self.random_computer_name
      %w[Jarvis Ultron Siri].sample
    end

    def self.create_player(name)
      role = 'code_maker'
      Player.new(name, role)
    end
  end

  # class Game deals with all game dynamics
  class Game
    attr_accessor :decode_board, :players, :current_code_maker_id

    def initialize(player_one, player_two)
      @players = [player_one, player_two]
      @current_code_maker_id = 0
      # @decode_board = current_code_maker.code
    end

    def current_decode_board
      @decode_board = current_code_maker.code
    end

    def current_code_breaker_id
      1 - @current_code_maker_id
    end

    def current_code_maker
      @players[current_code_maker_id]
    end

    def current_code_breaker
      @players[current_code_breaker_id]
    end

    def switch_player_roles
      current_code_maker.role = 'code_breaker'
      @current_code_maker_id = current_code_breaker_id
      current_code_maker.role = 'code_maker'
    end

    def award_points
      current_code_maker.points += 1
    end

    def switch_play
      clear_decode_board
      switch_player_roles
      # make_new_decode_board_codes
    end

    def make_new_decode_board_codes
      current_board_codes = create_the_codes
      current_code_maker.make_code(current_board_codes)
    end

    def make_guess
      educated_guess = []
      12.times do
        current_code_breaker.code = create_the_codes
        board_code_guess = current_code_breaker.code
        award_points
        break if board_code_guess == current_decode_board

        board_code_guess.each do |code_attampt|
          current_decode_board.each do |right_code|
            if code_attampt == right_code
              if board_code_guess.find_index(code_attampt) == current_decode_board.find_index(right_code)
                educated_guess.insert(decode_board.find_index(right_code), right_code)
              else
                puts "#{code_attampt} is correct but in the wrong position"
              end
            end
          end
        end
      end
    end

    def check_win
      if current_code_maker.points > current_code_breaker.points
        puts "#{current_code_maker.name} is the winner"
      elsif current_code_maker.points < current_code_breaker.points
        puts "#{current_code_breaker.name} is the winner"
      else
        puts 'This is a tie'
      end
    end

    def create_the_codes
      color_codes = []
      puts 'What color codes do you have in mind ?'
      puts ' You options are red, green, blue, yellow, white, purple, orange, green'
      4.times do |i|
        puts "What is your # #{i + 1} # color code ?"
        color = gets.downcase.chomp
        color_codes << color
      end
      color_codes
    end

    def game_play
      puts "Hey #{current_code_maker.name} lets have a secret"
      make_new_decode_board_codes
      make_guess
      switch_play
    end

    # def check_guess

    private

    def clear_decode_board
      self.decode_board = Array.new(4, nil)
    end
  end
end

include Mastermind

mastermind_one = Player.new('Gaetano', 'code_maker')
mastermind_two = Player.new('Chester', 'code_breaker')

game = Game.new(mastermind_one, mastermind_two)

puts 'How many times do you want to play the game ?'
game_number = gets.chomp.to_i

game_number.times do
  game.game_play
end
game.check_win
