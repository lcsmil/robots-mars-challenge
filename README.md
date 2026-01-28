# Martian Robots - Code Challenge

A solution to the Robots Mars challenge, implemented in Dart.

## Prerequisites
- **Dart SDK 3.10.0 or higher**

## How to Run
- **Run the command** `dart run bin/main.dart` **and type or paste the input manually. Press Ctrl+D (Unix) or Ctrl+Z (Windows) to end input.**

## How to Test
- **Run tests:** `dart test`

## Architecture and Design Decisions
- This solution follows **Clean Architecture** to separate business rules from implementation details.

### Domain Layer (lib/domain/)
- The **Direction enum** encapsulates rotation logic (.left, .right), keeping the **Robot** focused on state

### Application Layer (lib/application/)
- Instructions (L, R, F) are separate classes implementing the **Instruction** interface
- To add a new command (e.g., B for Backwards), create a **MoveBackward** class; no **Robot** or mission control changes needed
- The **InstructionParser** isolates string parsing, guarding against malformed input

### Infrastructure Layer (bin/)
- **main.dart** reads streams, splits lines, and validates input formats so the domain receives only valid data

## Assumptions
- Input lines may be `x y dir instructions` (4 parts) or `x y dir` (3 parts). If instructions are missing, the robot initializes but performs no moves; the parser defaults to an empty command list.
- Coordinates are 0-indexed. The top-right input (e.g., 5 3) defines the inclusive maximum indices. Any coordinate < 0 or > max is off-grid.
- Unknown characters in the instruction string are ignored to avoid crashes on dirty input.
