# frozen_string_literal:true

# Board class impelementation
class Board
  def initialize
    @board_grid = Array.new(3) { Array.new(3, nil) }
  end

  def display
    puts "\n"
    @board_grid.each_with_index do |row, i|
      puts(row.map { |cell| cell.center(5).join '|' })
      puts '-' * 17 unless i == 2
    end
    puts "\n"
  end

  def change_position(player)
    if board_cell_empty?
      if check_nil_cell?(player)
        board_cells[player.position] = player.marker
      else
        change_position(player)
      end
    else
      puts 'The board is already full'
    end
  end

  def board_cell_empty?
    board_cells.any? nil
  end

  def check_nil_cell?(player)
    if board_cells[player.position].nil?
      true
    else
      false
    end
  end

  def win_check(player, opponent)
    if cell_check(player)
      puts "#{player.name} wins the game"
    elsif cell_check(opponent)
      puts "#{opponent.name} wins the game"
    elsif board_cell_empty?
      puts 'The board still hase empty cells, continue playing'
    elsif !board_cell_empty?
      puts 'The board is full, this is a draw'
    end
  end

  def cell_check(player)
    if board_cells[0] == board_cells[1] && board_cells[1] == board_cells[2] && board_cells[2] == player.marker ||
       board_cells[3] == board_cells[4] && board_cells[4] == board_cells[5] && board_cells[5] == player.marker ||
       board_cells[6] == board_cells[7] && board_cells[7] == board_cells[8] && board_cells[8] == player.marker ||
       board_cells[0] == board_cells[3] && board_cells[1] == board_cells[2] && board_cells[2] == player.marker ||
       board_cells[1] == board_cells[4] && board_cells[4] == board_cells[7] && board_cells[7] == player.marker ||
       board_cells[2] == board_cells[5] && board_cells[5] == board_cells[6] && board_cells[6] == player.marker ||
       board_cells[0] == board_cells[4] && board_cells[4] == board_cells[8] && board_cells[8] == player.marker ||
       board_cells[2] == board_cells[4] && board_cells[4] == board_cells[6] && board_cells[6] == player.marker
      true
    else
      false
    end
  end

  def clean_the_board
    self.board_cells = Array.new(9, nil)
  end
end
