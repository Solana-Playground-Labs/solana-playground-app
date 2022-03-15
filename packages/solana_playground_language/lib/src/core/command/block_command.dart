import 'package:solana_playground_language/src/core/command/abstract_command.dart';

class BlockCommand extends Command {
  final List<Command> commands;

  const BlockCommand({required this.commands});

  @override
  List<Object> get props => [commands];

  factory BlockCommand.fromJson(Map<String, dynamic> json) {
    return BlockCommand(
      commands: List.castFrom(
        json['commands'].map((e) => Command.fromJson(e)).toList(),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "type": classType,
        "commands": commands.map((e) => e.toJson()).toList(),
      };
}
