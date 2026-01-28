import 'package:robots_mars_challenge/application/instruction_parser.dart';
import 'package:robots_mars_challenge/domain/direction.dart';
import 'package:robots_mars_challenge/domain/grid.dart';
import 'package:robots_mars_challenge/domain/robot.dart';
import 'package:test/test.dart';

void main() {
  group('Robots Mars Challenge Acceptance Tests', () {
    test('Robot movement', () {
      final grid = MarsGrid(5, 3);

      var r1 = Robot(1, 1, Direction.E);
      var i1 = InstructionParser.parse("RFRFRFRF");
      for (var i in i1) {
        i.execute(r1, grid);
      }
      expect(r1.toString(), "1 1 E");

      var r2 = Robot(3, 2, Direction.N);
      var i2 = InstructionParser.parse("FRRFLLFFRRFLL");
      for (var i in i2) {
        i.execute(r2, grid);
      }
      expect(r2.toString(), "3 3 N LOST");
      
      expect(grid.hasScent(3, 3), true);

      var r3 = Robot(0, 3, Direction.W);
      var i3 = InstructionParser.parse("LLFFFLFLFL");
      for (var i in i3) {
        i.execute(r3, grid);
      }
      expect(r3.toString(), "2 3 S");
    });
    
    test('Scent Logic: Robot ignores fatal move', () {
       final grid = MarsGrid(5, 5);
       
       var r1 = Robot(0, 5, Direction.N);
       InstructionParser.parse("F").first.execute(r1, grid);
       expect(r1.isLost, true);
       expect(grid.hasScent(0, 5), true);
       
       var r2 = Robot(0, 5, Direction.N);
       InstructionParser.parse("F").first.execute(r2, grid);
       
       expect(r2.isLost, false);
       expect(r2.y, 5);
    });
  });
}