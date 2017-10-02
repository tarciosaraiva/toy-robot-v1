require 'simulation/direction'

module Simulation
  class Position
    attr_reader :x_coordinate, :y_coordinate, :facing_direction

    def initialize(x_coordinate, y_coordinate, facing_direction)
      @x_coordinate     = x_coordinate
      @y_coordinate     = y_coordinate
      @facing_direction = facing_direction
    end

    def to_s
      "#{@x_coordinate},#{@y_coordinate},#{@facing_direction}"
    end

    def neighbour_for_moving_direction
      case @facing_direction
        when Simulation::Direction::NORTH
          [ @x_coordinate, @y_coordinate + 1 ]
        when Simulation::Direction::NORTHEAST
          [ @x_coordinate + 1, @y_coordinate + 1 ]
        when Simulation::Direction::EAST
          [ @x_coordinate + 1, @y_coordinate ]
        when Simulation::Direction::SOUTHEAST
          [ @x_coordinate + 1, @y_coordinate - 1 ]
        when Simulation::Direction::SOUTH
          [ @x_coordinate, @y_coordinate - 1 ]
        when Simulation::Direction::SOUTHWEST
          [ @x_coordinate - 1, @y_coordinate - 1 ]
        when Simulation::Direction::WEST
          [ @x_coordinate - 1, @y_coordinate ]
        when Simulation::Direction::NORTHWEST
          [ @x_coordinate - 1, @y_coordinate + 1 ]
      end
    end
  end
end # Position
