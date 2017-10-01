require 'simulation/direction'

describe Simulation::Direction do

  include Simulation::Direction

  [
    {
      current_direction: Simulation::Direction::NORTH,
      expected_left_direction: Simulation::Direction::NORTHWEST,
      expected_right_direction: Simulation::Direction::NORTHEAST
    },
    {
      current_direction: Simulation::Direction::NORTHWEST,
      expected_left_direction: Simulation::Direction::WEST,
      expected_right_direction: Simulation::Direction::NORTH
    },
    {
      current_direction: Simulation::Direction::WEST,
      expected_left_direction: Simulation::Direction::SOUTHWEST,
      expected_right_direction: Simulation::Direction::NORTHWEST
    },
    {
      current_direction: Simulation::Direction::SOUTHWEST,
      expected_left_direction: Simulation::Direction::SOUTH,
      expected_right_direction: Simulation::Direction::WEST
    },
    {
      current_direction: Simulation::Direction::SOUTH,
      expected_left_direction: Simulation::Direction::SOUTHEAST,
      expected_right_direction: Simulation::Direction::SOUTHWEST
    },
    {
      current_direction: Simulation::Direction::SOUTHEAST,
      expected_left_direction: Simulation::Direction::EAST,
      expected_right_direction: Simulation::Direction::SOUTH
    },
    {
      current_direction: Simulation::Direction::EAST,
      expected_left_direction: Simulation::Direction::NORTHEAST,
      expected_right_direction: Simulation::Direction::SOUTHEAST
    },
    {
      current_direction: Simulation::Direction::NORTHEAST,
      expected_left_direction: Simulation::Direction::NORTH,
      expected_right_direction: Simulation::Direction::EAST
    },
  ].each do |obj|
    describe '#rotate_left_from' do
      it "should rotate to '#{obj[:expected_left_direction]}' from '#{obj[:current_direction]}'" do
        expect(rotate_left_from(obj[:current_direction])).to eql obj[:expected_left_direction]
      end
    end

    describe '#rotate_right_from' do
      it "should rotate to '#{obj[:expected_right_direction]}' from '#{obj[:current_direction]}'" do
        expect(rotate_right_from(obj[:current_direction])).to eql obj[:expected_right_direction]
      end
    end
  end

  describe '#facing_direction_valid?' do
    [
      Simulation::Direction::NORTH,
      Simulation::Direction::NORTHEAST,
      Simulation::Direction::EAST,
      Simulation::Direction::SOUTHEAST,
      Simulation::Direction::SOUTH,
      Simulation::Direction::SOUTHWEST,
      Simulation::Direction::WEST,
      Simulation::Direction::NORTHWEST,
  ].each do |facing_direction|
    it "returns #{facing_direction} direction if facing_direction valid" do
      expect(facing_direction_valid?(facing_direction)).to eql facing_direction
    end
  end

    it 'returns nil if facing_direction invalid' do
      expect(facing_direction_valid?('NORTH_EA')).to be_nil
    end
  end

end
