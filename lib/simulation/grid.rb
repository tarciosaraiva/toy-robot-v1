require 'simulation'

# Grid models the table top on which robot can move.
# Grid can queried about its north, east, south and west bounds
module Simulation
  class Grid
    def initialize(x_dimension_size, y_dimension_size)
      raise ArgumentError, "#{x_dimension_size} should be a positive value" unless x_dimension_size > 0
      raise ArgumentError, "#{y_dimension_size} should be a positive value" unless y_dimension_size > 0
      @x_dimension_size = x_dimension_size
      @y_dimension_size = y_dimension_size
    end

    def maximum_north_bound
      @y_dimension_size - 1
    end

    def maximum_south_bound
      0
    end

    def maximum_west_bound
      0
    end

    def maximum_east_bound
      @x_dimension_size - 1
    end

    def x_coordinate_within_bounds?(x_coordinate)
      x_coordinate >= maximum_west_bound && x_coordinate <= maximum_east_bound
    end

    def y_coordinate_within_bounds?(y_coordinate)
      y_coordinate >= maximum_south_bound && y_coordinate <= maximum_north_bound
    end
  end
end
