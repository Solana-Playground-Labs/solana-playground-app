import 'package:solana_playground_language/src/core/command/command.dart';

class BlockCommand extends Command {
  final List<Command> commands;

  const BlockCommand({required this.commands});

  @override
  List<Object> get props => [commands];
}
