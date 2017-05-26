require "spec_helper"
require "nasa/direction"

RSpec.describe Direction do
  describe "should return special direction code when " do
    it "turning right" do
      expect(Direction.code_when_turning_right 'N').to eq 'E'
      expect(Direction.code_when_turning_right 'E').to eq 'S'
      expect(Direction.code_when_turning_right 'S').to eq 'W'
      expect(Direction.code_when_turning_right 'W').to eq 'N'
    end

    it "turning left" do
      expect(Direction.code_when_turning_left 'N').to eq 'W'
      expect(Direction.code_when_turning_left 'W').to eq 'S'
      expect(Direction.code_when_turning_left 'S').to eq 'E'
      expect(Direction.code_when_turning_left 'E').to eq 'N'
    end
  end

  describe "coordinates in direction" do
    it "should move to north" do
      expect(Direction.coordinates_in_direction 3, 4, 'N').to eq [3, 5]
    end
    it "should move to south" do
      expect(Direction.coordinates_in_direction 3, 4, 'S').to eq [3, 3]
    end
    it "should move to west" do
      expect(Direction.coordinates_in_direction 3, 4, 'W').to eq [2, 4]
    end
    it "should move to east" do
      expect(Direction.coordinates_in_direction 3, 4, 'E').to eq [4, 4]
    end
  end
end
