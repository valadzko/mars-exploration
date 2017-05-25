class Rover
  attr_accessor :x_coord, :y_coord, :direction
  attr_reader :plateau

  def initialize(x, y, direction)
    @x_coord = x
    @y_coord = y
    @direction = direction
  end

  def deploy(plateau)
    if fit_into?(plateau)
      @plateau = plateau
    else
      message = "Rover (#{x_coord},#{y_coord}) did not land on plateau #{plateau.x_size}x#{plateau.y_size}"
      puts message
    end
  end

  def fit_into?(plateau)
    x_coord.between?(0, plateau.x_size) and y_coord.between?(0, plateau.y_size)
  end

  def landed?
    !!plateau
  end
end
