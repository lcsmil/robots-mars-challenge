enum Direction { N, E, S, W }

extension DirectionX on Direction {
  Direction get left {
    const map = {
      Direction.N: Direction.W,
      Direction.W: Direction.S,
      Direction.S: Direction.E,
      Direction.E: Direction.N,
    };
    return map[this]!;
  }

  Direction get right {
    const map = {
      Direction.N: Direction.E,
      Direction.E: Direction.S,
      Direction.S: Direction.W,
      Direction.W: Direction.N,
    };
    return map[this]!;
  }

  static Direction parse(String key) {
    return Direction.values.firstWhere(
      (e) => e.name == key,
      orElse: () => throw FormatException('Invalid direction: $key'),
    );
  }
}