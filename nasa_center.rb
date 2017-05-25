require "./plateau.rb"
require "./rover.rb"

class NasaCenter

  def self.input_data
    puts "Please input upper-right coordinates of the plateau, divided by space (default:5 5)"
    @plateau_x, @plateau_y = gets.chomp.split().map { |e| e.to_i  }
    puts "Please enter rover landing coordinates and direction code('N','E','S','W')"
    @rover_x, @rover_y, @rover_direction_code = gets.chomp.split()
    puts "Please enter rover route"
    @rover_route = gets.chomp
  end

  def self.explore_mars!
    input_data

    @plateau = Plateau.new(@plateau_x, @plateau_y)
    @rover = Rover.new(@rover_x.to_i, @rover_y.to_i, @rover_direction_code)

    @rover.deploy(@plateau)
    @rover.explore!(@rover_route)
  end
end

NasaCenter.explore_mars!
