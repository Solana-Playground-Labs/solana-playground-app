import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/command/unknown_command.dart';

class UnknownCommandBuilder extends CommandBuilder {
  final dynamic rawData;

  UnknownCommandBuilder({
    required this.rawData,
  });

  @override
  Command build() {
    return UnknownCommand(rawData: rawData);
  }

  @override
  CommandBuilder clone() {
    return UnknownCommandBuilder(rawData: rawData);
  }
}
