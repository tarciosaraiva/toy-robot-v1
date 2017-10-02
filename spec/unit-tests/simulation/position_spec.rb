require 'simulation/position'

describe Simulation::Position do

  let(:subject) { Simulation::Position.new(x_coordinate, y_coordinate, facing_direction) }

  let(:x_coordinate) { 3 }
  let(:y_coordinate) { 1 }
  let(:facing_direction) { 'NORTH' }

  describe '#new' do
    it 'creates object with passed parameters' do
      expect(subject.x_coordinate).to eql(x_coordinate)
      expect(subject.y_coordinate).to eql(y_coordinate)
      expect(subject.facing_direction).to eql(facing_direction)
    end
  end

  describe '#to_s' do
    it 'returns string representation in the format of X,Y,DIRECTION' do
      expect(subject.to_s).to eql("#{x_coordinate},#{y_coordinate},#{facing_direction}")
    end
  end

  describe '#neighbour_for_moving_direction' do
    describe 'when moving direction is NORTH' do
      let(:facing_direction) { 'NORTH' }

      it 'returns neighbour to the north' do
        expect(subject.neighbour_for_moving_direction).to eql [3, 2]
      end
    end

    describe 'when moving direction is SOUTH' do
      let(:facing_direction) { 'SOUTH' }

      it 'returns neighbour to the south' do
        expect(subject.neighbour_for_moving_direction).to eql [3, 0]
      end
    end

    describe 'when moving direction is EAST' do
      let(:facing_direction) { 'EAST' }

      it 'returns neighbour to the east' do
        expect(subject.neighbour_for_moving_direction).to eql [4, 1]
      end
    end

    describe 'when moving direction is WEST' do
      let(:facing_direction) { 'WEST' }

      it 'returns neighbour to the west' do
        expect(subject.neighbour_for_moving_direction).to eql [2, 1]
      end
    end

    describe 'when moving direction is NORTHEAST' do
      let(:facing_direction) { 'NORTHEAST' }

      it 'returns neighbour to the northeast' do
        expect(subject.neighbour_for_moving_direction).to eql [4, 2]
      end
    end

    describe 'when moving direction is SOUTHEAST' do
      let(:facing_direction) { 'SOUTHEAST' }

      it 'returns neighbour to the southeast' do
        expect(subject.neighbour_for_moving_direction).to eql [4, 0]
      end
    end

    describe 'when moving direction is NORTHWEST' do
      let(:facing_direction) { 'NORTHWEST' }

      it 'returns neighbour to the northwest' do
        expect(subject.neighbour_for_moving_direction).to eql [2, 2]
      end
    end

    describe 'when moving direction is SOUTHWEST' do
      let(:facing_direction) { 'SOUTHWEST' }

      it 'returns neighbour to the southwest' do
        expect(subject.neighbour_for_moving_direction).to eql [2, 0]
      end
    end
  end

end
