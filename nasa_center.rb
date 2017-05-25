require "./plateau.rb"
require "./rover.rb"

class NasaCenter

  def self.explore_mars!
    # todo

    # initialize Plato, Rovers
    # deploy rovers on the Plato
    # explore the plato!
    @plateau = Plateau.new(5,5)
    @rover = Rover.new(1,3,'N')

    @rover.deploy(@plateau)
    true
  end
end
