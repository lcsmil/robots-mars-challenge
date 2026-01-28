import '../../domain/instruction.dart';
import '../../domain/robot.dart';
import '../../domain/grid.dart';
import '../../domain/direction.dart';

class MoveForward implements Instruction {
  @override
  void execute(Robot robot, MarsGrid grid) {
    if (robot.isLost) return;

    int nextX = robot.x;
    int nextY = robot.y;

    switch (robot.direction) {
      case Direction.N: nextY++; break;
      case Direction.E: nextX++; break;
      case Direction.S: nextY--; break;
      case Direction.W: nextX--; break;
    }

    if (grid.isWithinBounds(nextX, nextY)) {
      robot.x = nextX;
      robot.y = nextY;
    } else {
      if (grid.hasScent(robot.x, robot.y)) {
        return; 
      } else {
        robot.isLost = true;
        grid.leaveScent(robot.x, robot.y);
      }
    }
  }
}