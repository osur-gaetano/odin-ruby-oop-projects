# frozen_string_literal:true

# Board class impelementation
class Board
  attr_accessor :board_cells

  def initialize
    self.board_cells = Array.new(9, nil)
  end

  def to_s
    " | |   |   |
    __| #{board_cells[0]}  | #{board_cells[1]} | #{board_cells[2]} |__
    __| #{board_cells[3]}  | #{board_cells[4]} | #{board_cells[5]} |__
    __| #{board_cells[6]}  | #{board_cells[7]} | #{board_cells[8]} |__
      | |   |   |"
  end

  def change_position(player)
    if board_cells.any?(nil)
      if board_cells[player.position - 1].nil?
        board_cells[player.position - 1] = player.marker
      else
        change_position(player)
      end
    else
      'The board is already full'
    end
  end

  def win_check(player, opponent)
    if cell_check(player)
      "#{player.name} wins the game"

    elsif cell_check(opponent)
      "#{opponent.name} wins the game"
    else
      'This is a draw'
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
end
