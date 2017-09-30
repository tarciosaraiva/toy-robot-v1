require 'simulation/direction'

describe Simulation::Direction do

  include Simulation::Direction

  describe '#rotate_left_from' do
    [
      { current_direction: Simulation::Direction::NORTH, expected_direction: Simulation::Direction::WEST },
      { current_direction: Simulation::Direction::WEST, expected_direction: Simulation::Direction::SOUTH },
      { current_direction: Simulation::Direction::SOUTH, expected_direction: Simulation::Direction::EAST },
      { current_direction: Simulation::Direction::EAST, expected_direction: Simulation::Direction::NORTH },
    ].each do |obj|
      it "should rotate to '#{obj[:expected_direction]}' from '#{obj[:current_direction]}'" do
        expect(rotate_left_from(obj[:current_direction])).to eql obj[:expected_direction]
      end
    end
  end

  describe '#rotate_right_from' do
    [
      { current_direction: Simulation::Direction::NORTH, expected_direction: Simulation::Direction::EAST },
      { current_direction: Simulation::Direction::EAST, expected_direction: Simulation::Direction::SOUTH },
      { current_direction: Simulation::Direction::SOUTH, expected_direction: Simulation::Direction::WEST },
      { current_direction: Simulation::Direction::WEST, expected_direction: Simulation::Direction::NORTH },
    ].each do |obj|
      it "should rotate to '#{obj[:expected_direction]}' from '#{obj[:current_direction]}'" do
        expect(rotate_right_from(obj[:current_direction])).to eql obj[:expected_direction]
      end
    end
  end

end
