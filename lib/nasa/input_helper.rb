module Nasa
  class InputHelper

    attr_accessor :rovers, :plateau_x, :plateau_y

    def initialize(filepath)
      @rovers = []
      read_input_file filepath
    end

    private

    def read_input_file(filepath)
      validate_file(filepath)
      File.open(filepath, "r") do |file|
        lines = file.each_line

        read_plateau(lines.first)
        read_rovers(lines)
      end
    end

    def validate_file(path)
      raise 'File with expedition plan not found' unless File.file?(path)
    end

    def read_plateau(line)
      raise "Error reading plateau:#{line}" unless line.chomp! =~ /[0-9]+\s+[0-9]+\s*/

      self.plateau_x, self.plateau_y = line.split().map { |e| e.to_i  }

      if plateau_x == 0 || plateau_y == 0
        raise "Plateau #{plateau_x}x#{plateau_y} must be at least 1x1"
      end
    end

    def read_rovers(lines)
      lines.each_slice(2) do |rover_info|
        rover = read_coords_and_direction rover_info[0]
        rover[:route] = read_route rover_info[1]
        self.rovers << rover
      end
    end

    def read_coords_and_direction(line)
      unless line.chomp! =~ /[0-9]+\s+[0-9]+\s+[NWSE]\s*/
        raise "Error reading rover coordinates and direction:#{line}"
      end

      x, y, direction = line.split
      { x_coord: x.to_i, y_coord: y.to_i, direction_code: direction }
    end

    def read_route(line)
      raise "Error reading rover route:#{line}" unless line.chomp! =~ /[LMR]+\s*/

      line.strip
    end
  end
end
