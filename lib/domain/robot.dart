import 'direction.dart';

class Robot {
  int x;
  int y;
  Direction direction;
  bool isLost = false;

  Robot(this.x, this.y, this.direction);

  @override
  String toString() {
    return '$x $y ${direction.name}${isLost ? ' LOST' : ''}';
  }
}