import '../domain/instruction.dart';
import 'instructions/move_forward.dart';
import 'instructions/turn_left.dart';
import 'instructions/turn_right.dart';

class InstructionParser {
  static List<Instruction> parse(String rawCommands) {
    final List<Instruction> instructions = [];
    
    for (var char in rawCommands.split('')) {
      switch (char) {
        case 'L': instructions.add(TurnLeft()); break;
        case 'R': instructions.add(TurnRight()); break;
        case 'F': instructions.add(MoveForward()); break;
        
        default: break; 
      }
    }
    return instructions;
  }
}