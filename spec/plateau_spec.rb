require "spec_helper"
require "nasa/plateau"

RSpec.describe Nasa::Plateau do
  before(:all) { @plateau = Nasa::Plateau.new(5, 4) }

  it "should assign x,y and direction when create a new plateau" do
    expect(@plateau.x_size).to eq 5
    expect(@plateau.y_size).to eq 4
  end

  it "contains point inside the plateau" do
    expect(@plateau.contains?(2,2)).to eq true
  end

  it "does not contain the point outside" do
    expect(@plateau.contains?(5,5)).to eq false
  end
end
