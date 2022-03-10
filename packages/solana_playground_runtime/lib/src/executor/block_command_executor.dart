import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeBlockCommand(
  SPRuntime runtime,
  BlockCommand blockCommand,
) async {
  for (final command in blockCommand.commands) {
    runtime.execute(command);
  }
}
