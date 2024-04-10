# frozen_string_literal: true

# Class that manages user
class Player
  attr_reader :marker, :position

  attr_writter :position

  def initialize(marker, position)
    self.marker = marker
    self.position = position
  end
end
