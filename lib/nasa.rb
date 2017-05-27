require_relative "nasa/input_helper"
require_relative "nasa/plateau"
require_relative "nasa/rover"

module Nasa
  def self.explore_mars!
    default_filepath = File.join(File.dirname(__FILE__), '../tests/expedition_1')
    input = InputHelper.new(ARGV[0] || default_filepath)

    plateau = Plateau.new(input.plateau_x, input.plateau_y)

    created_rovers = []
    planned_routes = []

    input.rovers.each do |rover|
      created_rovers << Rover.new(rover[:x_coord], rover[:y_coord], rover[:direction_code])
      planned_routes << rover[:route]
    end

    created_rovers.each do |rover|
      rover.deploy!(plateau)
    end

    created_rovers.zip(planned_routes).each do |rover, route|
      rover.explore! route if rover.landed?
    end
  end
end

Nasa.explore_mars!
