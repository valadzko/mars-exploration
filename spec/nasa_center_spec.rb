require "spec_helper"
require "./nasa_center.rb"

RSpec.describe NasaCenter do
  it "explore_mars! should return true" do
    expect(NasaCenter.explore_mars!).to eq true
  end
end
