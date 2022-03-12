import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/command/get_recent_block_hash_command.dart';

class GetRecentBlockHashCommandBuilder extends CommandBuilder {
  String _variable;

  GetRecentBlockHashCommandBuilder({
    required String variable,
  }) : _variable = variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  @override
  Command build() {
    return GetRecentBlockHashCommand(variable: variable);
  }

  @override
  CommandBuilder clone() {
    return GetRecentBlockHashCommandBuilder(variable: variable);
  }

  factory GetRecentBlockHashCommandBuilder.empty() {
    return GetRecentBlockHashCommandBuilder(variable: "");
  }
}
