require_relative "nasa/input_helper"
require_relative "nasa/plateau"
require_relative "nasa/rover"

class Nasa

  def self.explore_mars!
    input = InputHelper.new

    @plateau = Plateau.new(input.plateau_x, input.plateau_y)

    created_rovers = []
    planned_routes = []

    input.rovers.each do |rover|
      created_rovers << Rover.new(rover[:x], rover[:y], rover[:direction_code])
      planned_routes << rover[:route]
    end

    created_rovers.each do |rover|
      rover.deploy!(@plateau)
    end

    created_rovers.zip(planned_routes).each do |rover, route|
      rover.explore! route if rover.landed?
    end
  end
end

Nasa.explore_mars!
