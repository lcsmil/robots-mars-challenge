import '../../domain/instruction.dart';
import '../../domain/robot.dart';
import '../../domain/grid.dart';
import '../../domain/direction.dart';

class TurnLeft implements Instruction {
  @override
  void execute(Robot robot, MarsGrid grid) {
    if (robot.isLost) return;
    robot.direction = robot.direction.left;
  }
}