import 'robot.dart';
import 'grid.dart';

abstract class Instruction {
  void execute(Robot robot, MarsGrid grid);
}