# frozen_string_literal: true

# Class that manages user
class Player
  attr_accessor :marker, :position, :name

  def initialize(name, marker)
    self.name = name
    self.marker = marker
  end
end
