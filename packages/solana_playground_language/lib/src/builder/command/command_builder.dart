import 'package:observable/observable.dart';
import 'package:solana_playground_language/src/core/command/abstract_command.dart';

import '../core_builder.dart';

abstract class CommandBuilder extends Builder {
  Command build();

  @override
  CommandBuilder clone();
}

extension ListBuilderExtension on ListBuilder<CommandBuilder> {
  List<Command> build() {
    return map((e) => e.build()).toList();
  }

  ListBuilder<CommandBuilder> clone() {
    return ListBuilder(map((e) => e.clone()).toList());
  }
}