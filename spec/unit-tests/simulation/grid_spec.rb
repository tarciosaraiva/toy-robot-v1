require 'simulation/grid'

describe Simulation::Grid do

  subject { Simulation::Grid.new(x_dimension_size, y_dimension_size) }

  context ".new" do

    context "when invalid grid size is provided" do
      let(:x_dimension_size) { -5 }
      let(:y_dimension_size) { -5 }

      it "does not set up the grid for robot" do
        expect{ subject }.to raise_error
      end
    end
  end

  context "valid grid initialization" do
    let(:x_dimension_size) { 7 }
    let(:y_dimension_size) { 5 }

    it "grid returns the correct maximum north bounds" do
      expect(subject.maximum_north_bound).to eq(4)
    end

    it "grid returns the correct maximum south bounds" do
      expect(subject.maximum_south_bound).to eq(0)
    end

    it "grid returns the correct maximum west bounds" do
      expect(subject.maximum_west_bound).to eq(0)
    end

    it "grid returns the correct maximum east bounds" do
      expect(subject.maximum_east_bound).to eq(6)
    end
  end

  context 'boundary validations' do
    let(:x_dimension_size) { 5 }
    let(:y_dimension_size) { 5 }

    context '#x_coordinate_within_bounds?' do
      it 'returns false when out of max east bounds' do
        expect(subject.x_coordinate_within_bounds?(6)).to be_falsey
      end

      it 'returns false when out of max west bounds' do
        expect(subject.x_coordinate_within_bounds?(-1)).to be_falsey
      end

      it 'returns true when on max west bounds' do
        expect(subject.x_coordinate_within_bounds?(0)).to be_truthy
      end

      it 'returns true when on max east bounds' do
        expect(subject.x_coordinate_within_bounds?(4)).to be_truthy
      end

      it 'returns true when within bounds' do
        expect(subject.x_coordinate_within_bounds?(2)).to be_truthy
      end
    end

    context '#y_coordinate_within_bounds?' do
      it 'returns false when out of max north bounds' do
        expect(subject.y_coordinate_within_bounds?(6)).to be_falsey
      end

      it 'returns false when out of max south bounds' do
        expect(subject.y_coordinate_within_bounds?(-1)).to be_falsey
      end

      it 'returns true when on max south bounds' do
        expect(subject.y_coordinate_within_bounds?(0)).to be_truthy
      end

      it 'returns true when on max north bounds' do
        expect(subject.y_coordinate_within_bounds?(4)).to be_truthy
      end

      it 'returns true when within bounds' do
        expect(subject.y_coordinate_within_bounds?(2)).to be_truthy
      end
    end
  end
end
