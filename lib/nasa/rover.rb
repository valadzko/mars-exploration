require_relative 'direction'

module Nasa
  class Rover
    attr_accessor :x_coord, :y_coord, :direction_code, :plateau
    include Direction

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
          raise "Unknown action code: #{action}"
        end
      end
      report
    end

    def deploy!(plateau)
      if plateau.contains?(x_coord, y_coord)
        self.plateau = plateau
      else
        message = "Warning: rover (#{x_coord},#{y_coord}) did not land on plateau #{plateau.x_size}x#{plateau.y_size}"
        puts message
      end
    end

    def landed?
      !!plateau
    end

    private

    def report
      puts "#{x_coord} #{y_coord} #{direction_code}"
    end

    def turn_right
      self.direction_code = code_when_turning_right direction_code
    end

    def turn_left
      self.direction_code = code_when_turning_left direction_code
    end

    def move_ahead
      new_x, new_y = coordinates_in_direction(x_coord, y_coord, direction_code)
      if plateau.contains?(new_x, new_y)
        self.x_coord, self.y_coord = new_x, new_y
      else
        puts "Warning: skipped step with rover moving out of the plateau: x=#{new_x},y=#{new_y}"
      end
    end
  end
end
