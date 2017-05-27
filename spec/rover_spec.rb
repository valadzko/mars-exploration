require "spec_helper"
require "nasa/rover"
require "nasa/plateau"

RSpec.describe Nasa::Rover do
  it "should assign x,y and direction when create a new rover" do
    rover = Nasa::Rover.new(5, 4, 'N')

    expect(rover.x_coord).to eq 5
    expect(rover.y_coord).to eq 4
    expect(rover.direction_code).to eq 'N'
  end

  describe "explore route" do
    let(:rover) { Nasa::Rover.new(5, 4, 'N') }

    before do
      allow_any_instance_of(Nasa::Rover)
      .to receive_messages(move_ahead: nil, turn_left: nil, turn_right: nil)
    end

    it "should receive move_ahead if route contains M" do
      expect(rover).to receive(:move_ahead).exactly(2).times
      rover.explore! "MMRL"
    end

    it "should turn left if route contains L" do
      expect(rover).to receive(:turn_left).once
      rover.explore! "L"
    end

    it "should turn right if route contains R" do
      expect(rover).to receive(:turn_right).once
      rover.explore! "MRL"
    end
  end

  describe "deploy rover on plateau" do

    context "successfully deployed" do
      let(:rover) { Nasa::Rover.new(5, 4, 'N') }

      it "should assing plateau to rover" do
        plateau = Nasa::Plateau.new(5, 5)
        rover.deploy!(plateau)
        expect(rover.plateau).to eq plateau
      end

      it "should be marked as landed" do
        plateau = Nasa::Plateau.new(5, 5)
        rover.deploy!(plateau)
        expect(rover.landed?).to eq true
      end
    end

    context "failed to deploy" do
      let(:rover) { Nasa::Rover.new(7, 4, 'N') }
      let(:plateau) { Nasa::Plateau.new(5, 5) }

      it "print message about deployment failure" do
        error = "Warning: rover (#{rover.x_coord},#{rover.y_coord}) did not land on plateau #{plateau.x_size}x#{plateau.y_size}"
        expect(STDOUT).to receive(:puts).with(error)

        rover.deploy!(plateau)
        expect(rover.landed?).to eq false
      end

      it "should not be deployed" do
        rover.deploy!(plateau)
        expect(rover.landed?).to eq false
      end
    end
  end
end
