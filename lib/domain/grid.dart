import 'dart:collection';

class MarsGrid {
  final int maxX;
  final int maxY;

  final HashSet<int> _scents = HashSet();

  MarsGrid(this.maxX, this.maxY);

  bool isWithinBounds(int x, int y) {
    return x >= 0 && x <= maxX && y >= 0 && y <= maxY;
  }

  void leaveScent(int x, int y) {
    _scents.add(_hash(x, y));
  }

  bool hasScent(int x, int y) {
    return _scents.contains(_hash(x, y));
  }

  int _hash(int x, int y) => (x * 1000) + y;
}
