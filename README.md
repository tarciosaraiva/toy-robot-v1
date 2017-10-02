Robot Simulation
=====

1. Ensure that following dependencies are met
   - ruby version is  *ruby-2.2.0*
   - rbenv is installed (as the app uses .ruby-version)
   - run `bundle --path=.bundle --binstubs` to install all gems

2. To run specs 'bundle exec rspec'

3. To run the robot simulation, just type
   `./scripts/robot_simulator ./scripts/command.txt`

   - all the commands are place in the `command.txt` file in scripts folder
    * commands are read from this file & fed into the simulated robot.
    * it includes valid commands ( MOVE, PLACE, LEFT, RIGHT)
    * few invalid commands (just to check error handling)

4. All error, exception (when robot can fall due to a command), debug information is logged into the log file `log/robot_[environment]. log`.

Approach and tradeoffs
---
I initially looked at the design of the code and it looked quite modularised. I like the use of the Command pattern but, although I thought was a bit overkill, decided not to change that since it was working well.

Ran the program, noticed it failed since no `log` directory existed. Ran the tests, same thing. Decided to fix that and got it all working.

Then I started looking at what I needed to change in small bits: add the new directions, ensure the command_interpreter supports the new directions, ensure the logic is changed. The robot seemed too big to me and the position, in my opinion, was not fully utilised.

Then started changing the smaller bits first, adding tests where there was none.

The challenging part was how we could improve the logic. There was a bit of repetition on the robot class to verify the direction and I figured I could move some of that stuff into the Position class so it can report its facing neighbour depending on the direction the robot was looking at.

Doing that simplified the robot class substantially and I managed to get the new directions working.

Until I realised that there was a logic error on the grid. A 5 x 5 grid where the first position is ZERO has the max opposite bound equal to the length of the grid minus 1. Thus, if position 0,0 is the south west most corner of the grid, position 4,4 is the north east most corner of the grid.

Fixed that and added more commands.
