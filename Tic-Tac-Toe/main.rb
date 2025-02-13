load 'board.rb'
load 'player.rb'

def play_turn(player, board)
  puts ' This is the current state of the board'
  puts board
  puts
  puts " It is #{player.name.upcase}'s play tune"
  puts ' Where do you want your marker placed ?'
  player_position = gets.chomp.to_i
  player.position = player_position
  board.change_position(player)
end

def game_play(player_one, player_two, board)
  while board.board_cell_empty?
    play_turn(player_one, board)
    play_turn(player_two, board)
    board.win_check(player_one, player_two)
    unless board.board_cell_empty?
      puts 'The board is filled and there is no winner'
      puts 'We are going ahead to clean it up'
      board.clean_the_board
    end
  end
end

puts 'What is your name PLAYER ONE'
player_one_name = gets.chomp

puts 'What is the marker of choice "X" or "O"'
player_one_marker = gets.chomp.capitalize

puts 'What is your name PLAYER TWO'
player_two_name = gets.chomp

if player_one_marker == 'X'
  player_two_marker = 'O'
else
  player_two_marker = 'X'
end

player_one = Player.new(player_one_name, player_one_marker)
player_two = Player.new(player_two_name, player_two_marker)
board = Board.new
game_play(player_one, player_two, board)
