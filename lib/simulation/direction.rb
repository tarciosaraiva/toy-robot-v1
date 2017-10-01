module Simulation
  module Direction
    NORTH = "NORTH"
    SOUTH = "SOUTH"
    EAST  = "EAST"
    WEST  = "WEST"
    NORTHEAST = "NORTHEAST"
    SOUTHEAST = "SOUTHEAST"
    NORTHWEST = "NORTHWEST"
    SOUTHWEST = "SOUTHWEST"

    def rotate_left_from(direction)
      case direction
      when NORTH
        NORTHWEST
      when NORTHWEST
        WEST
      when WEST
        SOUTHWEST
      when SOUTHWEST
        SOUTH
      when SOUTH
        SOUTHEAST
      when SOUTHEAST
        EAST
      when EAST
        NORTHEAST
      when NORTHEAST
        NORTH
      end
    end

    def rotate_right_from(direction)
      case direction
      when NORTH
        NORTHEAST
      when NORTHEAST
        EAST
      when EAST
        SOUTHEAST
      when SOUTHEAST
        SOUTH
      when SOUTH
        SOUTHWEST
      when SOUTHWEST
        WEST
      when WEST
        NORTHWEST
      when NORTHWEST
        NORTH
      end
    end

    def facing_direction_valid?(facing_direction)
      facing_direction[/^(#{NORTH}|#{EAST}|#{WEST}|#{SOUTH}|#{NORTHEAST}|#{NORTHWEST}|#{SOUTHEAST}|#{SOUTHWEST})$/]
    end
  end
end
