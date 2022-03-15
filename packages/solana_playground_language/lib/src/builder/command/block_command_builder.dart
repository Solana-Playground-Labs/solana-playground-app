/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/block_command.dart';
import 'package:solana_playground_language/src/core/command/abstract_command.dart';

class BlockCommandBuilder extends CommandBuilder {
  ListBuilder<CommandBuilder> commands;

  BlockCommandBuilder({required List<CommandBuilder> commands})
      : commands = ListBuilder<CommandBuilder>(commands);

  void update(void Function(ListBuilder<CommandBuilder> commands) callback) {
    callback(commands);
    notifyListeners();
  }

  @override
  BlockCommand build() {
    return BlockCommand(commands: commands.build());
  }

  @override
  BlockCommandBuilder clone() {
    return BlockCommandBuilder(commands: commands.clone());
  }
}
