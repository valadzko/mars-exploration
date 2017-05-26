class InputHelper

  attr_reader :rovers, :plateau_x, :plateau_y

  def initialize
    input_plateau

    enough_rovers = false
    @rovers = []

    until enough_rovers do
      @rover = {}
      input_coordinates_and_direction(@rover)
      input_route(@rover)

      @rovers << @rover

      begin
        puts "Would you like to add one more rover? (y/n)(Press Enter to default: n)"
        input = gets.chomp
        if input.empty? || input =~ /^\s*[n]\s*$/
          valid_input = true
          enough_rovers = true
        elsif input =~ /^\s*[y]\s*$/
          valid_input = true
        end
      end until valid_input
    end
  end

  private

  def input_plateau
    begin
      puts "Please input upper-right coordinates of the plateau, two integer numbers divided by space (Press Enter for default:5 5)"
      input = gets.chomp
      if input.empty?
        @plateau_x, @plateau_y = [5, 5]
        valid_input = true
      elsif input =~ /^\s*[\d]+\s+[\d]+\s*$/
        @plateau_x, @plateau_y = input.split().map { |e| e.to_i  }
        valid_input = true
      end
    end until valid_input
    puts "Plateau dimension: #{@plateau_x}x#{@plateau_y}"
  end

  def input_coordinates_and_direction(rover)
    valid_input = false
    begin
      puts "Please input rover coordinates and direction code(N,W,E,S)(Press Enter for default:1 2 N)"
      input = gets.chomp
      if input.empty?
        rover[:x], rover[:y], rover[:direction_code] = 1, 2, 'N'
        valid_input = true
      elsif input =~ /^\s*[\d]+\s+[\d]+\s+[NWSE]\s*$/
        rover[:x], rover[:y], rover[:direction_code] = input.split()
        rover[:x] = rover[:x].to_i
        rover[:y] = rover[:y].to_i
        valid_input = true
      end
    end until valid_input
    puts "Rover coordinates and direction code: #{rover[:x]}, #{rover[:y]}, #{rover[:direction_code]}"
  end

  def input_route(rover)
    valid_input = false
    begin
      puts "Please input route for rover, use any combination of M, L, R (Press Enter for default:LMLMLMLMM )"
      input = gets.chomp
      if input.empty?
        rover[:route] = 'LMLMLMLMM'
        valid_input = true
      elsif input =~ /^\s*[LMR]+\s*$/
        rover[:route] = input.strip
        valid_input = true
      end
    end until valid_input
    puts "Route is: #{@rover[:route]}"
  end
end
