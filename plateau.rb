class Plateau
  attr_reader :x_size, :y_size

  def initialize(x, y)
    @x_size = x
    @y_size = y
  end

  def contains?(x,y)
    x.between?(0, x_size) and y.between?(0, y_size)
  end
end
