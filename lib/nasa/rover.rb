require_relative 'direction'

class Rover
  attr_accessor :x_coord, :y_coord, :direction_code, :plateau

  def initialize(x, y, direction_code)
    @x_coord = x
    @y_coord = y
    @direction_code = direction_code
  end

  def explore!(route)
    route.chars.each do |action|
      case action
      when "M"
        move_ahead
      when "L"
        turn_left
      when "R"
        turn_right
      else
        puts "Unknown action code: #{action}"
      end
    end
    report
  end

  def report
    puts "#{x_coord} #{y_coord} #{direction_code}"
  end

  def turn_right
    self.direction_code = Direction.code_when_turning_right direction_code
  end

  def turn_left
    self.direction_code = Direction.code_when_turning_left direction_code
  end

  def move_ahead
    new_x, new_y = Direction.coordinates_in_direction(x_coord, y_coord, direction_code)
    if plateau.contains?(new_x, new_y)
      self.x_coord, self.y_coord = new_x, new_y
    else
      puts "Rover tried to move out of the plateau: x=#{new_x},y=#{new_y}"
    end
  end

  def deploy!(plateau)
    if plateau.contains?(x_coord, y_coord)
      self.plateau = plateau
    else
      message = "Rover (#{x_coord},#{y_coord}) did not land on plateau #{plateau.x_size}x#{plateau.y_size}"
      puts message
    end
  end

  def landed?
    !!plateau
  end
end
