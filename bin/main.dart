
import 'dart:convert';
import 'dart:io';

import 'package:robots_mars_challenge/application/instruction_parser.dart';
import 'package:robots_mars_challenge/domain/direction.dart';
import 'package:robots_mars_challenge/domain/grid.dart';
import 'package:robots_mars_challenge/domain/robot.dart';

void main() {
  runApp(stdin);
}

void runApp(Stream<List<int>> input) async {
  final lines = await input
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .toList();

  if (lines.isEmpty) return;

  final validLines = lines.where((l) => l.trim().isNotEmpty).toList();
  if (validLines.isEmpty) return;

  final gridParts = validLines[0].trim().split(RegExp(r'\s+'));
  if (gridParts.length < 2) throw FormatException("Invalid Grid Config");
  
  final grid = MarsGrid(int.parse(gridParts[0]), int.parse(gridParts[1]));

  print('');
  print('');
  
  for (int i = 1; i < validLines.length; i++) {
    var line = validLines[i].trim();
    var parts = line.split(RegExp(r'\s+'));

    if (parts.length < 3) continue;

    int x = int.parse(parts[0]);
    int y = int.parse(parts[1]);
    Direction dir = DirectionX.parse(parts[2]);

    String commandString = "";
    
    if (parts.length >= 4) {
      commandString = parts[3];
    }

    Robot robot = Robot(x, y, dir);
    var instructions = InstructionParser.parse(commandString);

    for (var command in instructions) {
      command.execute(robot, grid);
      if (robot.isLost) break;
    }

    print(robot);
  }
}