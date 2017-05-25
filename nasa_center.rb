require "./plateau.rb"
require "./rover.rb"

class NasaCenter

  def self.explore_mars!
    # todo

    # initialize Plato, Rovers
    # deploy rovers on the Plato
    # sequentially explore the plato with routes for rovers
    @plateau = Plateau.new(5,5)
    @rover = Rover.new(1,3,'N')

    @rover.deploy(@plateau)
    @rover.explore!("LMLMLMLMM")
    true
  end
end
