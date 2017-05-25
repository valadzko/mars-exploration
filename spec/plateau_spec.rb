require "spec_helper"
require "./plateau.rb"

RSpec.describe Plateau do

  it "should assign x,y and direction when create a new plateau" do
    rover = Plateau.new(5, 4)

    expect(rover.x_size).to eq 5
    expect(rover.y_size).to eq 4
  end
end
