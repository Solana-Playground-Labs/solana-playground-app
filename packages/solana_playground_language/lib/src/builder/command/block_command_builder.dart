import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/block_command.dart';
import 'package:solana_playground_language/src/core/command/command.dart';

class BlockCommandBuilder extends CommandBuilder {
  ListBuilder<CommandBuilder> commands;

  BlockCommandBuilder({required this.commands});

  @override
  Command build() {
    return BlockCommand(commands: commands.build());
  }

  @override
  BlockCommandBuilder clone() {
    return BlockCommandBuilder(commands: commands.clone());
  }
}
