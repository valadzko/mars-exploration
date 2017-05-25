require "spec_helper"
require "./rover.rb"
require "./plateau.rb"

RSpec.describe Rover do
  it "should assign x,y and direction when create a new rover" do
    rover = Rover.new(5, 4, 'N')

    expect(rover.x_coord).to eq 5
    expect(rover.y_coord).to eq 4
    expect(rover.direction).to eq 'N'
  end

  describe "deploy rover on plateau" do

    it "should assing plateau to rover" do
      rover = Rover.new(5, 4, 'N')
      plateau = Plateau.new(5, 5)
      rover.deploy(plateau)
      expect(rover.plateau).to eq plateau
      expect(rover.landed?).to eq true
    end

    it "print message if rover was not deployed" do
      rover = Rover.new(7, 4, 'N')
      plateau = Plateau.new(5, 5)

      error = "Rover (#{rover.x_coord},#{rover.y_coord}) did not land on plateau #{plateau.x_size}x#{plateau.y_size}"
      expect(STDOUT).to receive(:puts).with(error)

      rover.deploy(plateau)
      expect(rover.landed?).to eq false
    end
  end
end
