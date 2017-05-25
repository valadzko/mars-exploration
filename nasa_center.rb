require "./plateau.rb"
require "./rover.rb"

class NasaCenter

  def self.input_data
    valid_input = false

    begin
      puts "Please input upper-right coordinates of the plateau, two integer numbers divided by space (Press Enter for default:5 5)"
      input = gets.chomp
      if input.empty?
        @plateau_x, @plateau_y = [5, 5]
        valid_input = true
      elsif input =~ /^\s?[\d]*\s+[\d]*\s?$/
        @plateau_x, @plateau_y = input.split().map { |e| e.to_i  }
        valid_input = true
      end
    end until valid_input
    puts "Plateau dimension: #{@plateau_x}x#{@plateau_y}"

    valid_input = false
    begin
      puts "Please input rover coordinates and direction code(N,W,E,S)(Press Enter for defaults: 1 2 N)"
      input = gets.chomp
      if input.empty?
        @rover_x, @rover_y, @rover_direction_code = 1, 2, 'N'
        valid_input = true
      elsif input =~ /^\s?[\d]*\s+[\d]*\s+[NWSE]\s?$/
        @rover_x, @rover_y, @rover_direction_code = input.split()
        @rover_x = @rover_x.to_i
        @rover_y = @rover_y.to_i
        puts "@rover is integer? #{@rover_x.class}"
        valid_input = true
      end
    end until valid_input
    puts "Rover coordinates and direction code: #{@rover_x}, #{@rover_y}, #{@rover_direction_code}"

    begin
      puts "Please input route for rover, use only M, L, R (Press Enter for default: LMLMLMLMM )"
      input = gets.chomp
      if input.empty?
        @rover_route = 'LMLMLMLMM'
        valid_input = true
      elsif input =~ /^\s*[LMR]+\s*$/
        @rover_route = input.strip
        valid_input = true
      end
    end until valid_input
    puts "Route is: #{@rover_route}"
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
