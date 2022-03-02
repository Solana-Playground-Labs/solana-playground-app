import 'package:solana_playground_language/src/builder/builder.dart';
import 'package:solana_playground_language/src/core/command/block_command.dart';
import 'package:solana_playground_language/src/core/command/command.dart';

class BlockCommandBuilder extends CommandBuilder {
  List<CommandBuilder> commands;

  BlockCommandBuilder({required this.commands});

  @override
  Command build() {
    return BlockCommand(commands: commands.map((e) => e.build()).toList());
  }

  @override
  BlockCommandBuilder clone() {
    return BlockCommandBuilder(
        commands: commands.map((e) => e.clone()).toList());
  }
}
