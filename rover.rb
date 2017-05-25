class Rover
  attr_accessor :x_coord, :y_coord, :direction

  def initialize(x, y, direction)
    @x_coord = x
    @y_coord = y
    @direction = direction
  end
end
