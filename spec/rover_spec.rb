require "spec_helper"
require "./rover.rb"

RSpec.describe Rover do

  it "should assign x,y and direction when create a new rover" do
    rover = Rover.new(5, 4, 'N')

    expect(rover.x_coord).to eq 5
    expect(rover.y_coord).to eq 4
    expect(rover.y_coord).to eq 'N'
  end
end
