# Toy Robot II - Judgement Day

> The 600 series had rubber skin. We spotted them easy, but these are new. They look human... sweat, bad breath, everything. Very hard to spot.

## The Challenge

If you're reading this then you've either written a solution for the original Toy Robot challenge or we've sent you a ready-made prototype, along with the original specifications.

The original Toy Robot has gone rogue and we need _you_ to create a more capable version; one that can outmanoeuvre the original.

The original version could only rotate on a 90-degree axis, we need you to upgrade it so that it can rotate on a 45-degree axis - effectively able to move diagonally on the surface (which remains unchanged).

As in the original Toy Robot challenge, there are no other obstructions on the table surface. The robot is free to roam around the surface of the table, but must still be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

The good news is that the application should still accept commands in the same form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

`PLACE` still puts the toy robot on the table in position `X,Y`. However, in addition to cardinal directions `NORTH`, `SOUTH`, `EAST` or `WEST`, this upgraded model can also face (F) intercardinal directions e.g. `NORTHEAST` or `SOUTHWEST`.

- The origin (0,0) can still be considered to be the south west most corner.

- The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command

- The application should discard all commands in the sequence until a
valid `PLACE` command has been executed.

- `MOVE` will move the toy robot one unit forward in the direction it is currently
facing. This direction may be diagonal.

- `LEFT` and `RIGHT` will now rotate the robot 45 degrees in the specified direction and still will not change the position of the robot.

- `REPORT` will announce the `X`,`Y` and `F` of the robot, as before.

- This can be in any form, but standard output is sufficient.

- A robot that is not on the table can still choose the ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.

- As before, input can be from a file, or from standard input, as the developer chooses.

- Provide test data to exercise the application.

**Constraints:**

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored.

**Example Input and Output:**

Example a)
```
PLACE 0,0,NORTH
MOVE
REPORT

> 0,1,NORTH
```

Example b)
```
PLACE 0,0,NORTH
LEFT
REPORT

> 0,0,NORTHWEST
```

Example c)
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT

> 4,3,NORTHEAST
```

Example d)
```
PLACE 2,0,NORTH
MOVE
LEFT
LEFT
MOVE
REPORT

> 1,1,WEST
```

## Deliverables

It is not required to provide any graphical output showing the movement of the toy robot.

We'd like to see:

- The solution
- A small explanation of your approach and any tradeoffs you made
- Your commit history

## What are we looking for?

- Does it work?
- Have you improved the code?
- What tradeoffs did you make?
- How well designed is the resulting code?
- What tests were added / changed?
- In what order did you make your changes?
- Will this Robot be capable of saving human kind?

We respect your time so please don't spend more than 2-3 hours working on this. We'd rather you submitted something partially complete after that time for us to discuss than spend days of your own time working on it.

## What comes next?

We'll send you feedback on your code. If the outcome isn't to the standard we require for the role we'll always aim to have you at least learn something from the process.

We may also want to discuss your code with you, to understand your approach and the tradeoffs you made.

**Thanks for applying for a job at Hooroo and good luck! :-)**
