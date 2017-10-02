require 'simulation/grid'
require 'simulation/position'
require 'simulation/direction'

module Simulation
  class InvalidPositionError < StandardError; end

  class Robot
    include Direction
    extend Forwardable

    def_delegators :@position, :x_coordinate, :y_coordinate, :facing_direction

    def initialize(grid)
      @grid = grid
    end

    def place(x_coordinate, y_coordinate, facing_direction)
      unless valid_placement?(x_coordinate, y_coordinate, facing_direction)
        raise InvalidPositionError,"Cannot place at (#{x_coordinate},#{y_coordinate}) facing #{facing_direction}."
      end
      @position = Position.new(x_coordinate, y_coordinate, facing_direction)
    end

    def placed_correclty?
      !!@position
    end

    def move
      unless placed_correclty?
        Simulation.logger.warn("Ignoring command to move as it is not positioned correctly.")
        return
      end

      new_x_coordinate, new_y_coordinate = @position.neighbour_for_moving_direction

      if valid_placement?(new_x_coordinate, new_y_coordinate, facing_direction)
        @position = Simulation::Position.new(new_x_coordinate, new_y_coordinate, facing_direction)
      end
    end

    def turn_left
      unless placed_correclty?
        Simulation.logger.warn("Ignoring command to turn left as it is not positioned correctly.")
        return
      end

      new_facing_direction = rotate_left_from(facing_direction)
      @position = Simulation::Position.new(x_coordinate, y_coordinate, new_facing_direction)
    end

    def turn_right
      unless placed_correclty?
        Simulation.logger.warn("Ignoring command to turn right as it is not positioned correctly.")
        return
      end
      new_facing_direction = rotate_right_from(facing_direction)
      @position = Simulation::Position.new(x_coordinate, y_coordinate, new_facing_direction)
    end

    def report
      unless placed_correclty?
        Simulation.logger.warn("Ignoring command to report as it is not positioned correctly.")
        return
      end

      $stdout.puts "  Output: #{@position}"
      "#{@position}"
    end

    private

    def valid_placement?(x, y, facing_direction)
      return false unless @grid.x_coordinate_within_bounds?(x)
      return false unless @grid.y_coordinate_within_bounds?(y)
      return false unless facing_direction_valid?(facing_direction)
      return true
    end
  end
end
