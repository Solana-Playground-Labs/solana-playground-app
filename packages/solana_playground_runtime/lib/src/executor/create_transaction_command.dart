import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeCreateTransactionCommand(
  SPRuntime runtime,
  CreateTransactionCommand command,
) async {
  final data = {
    "feePayer": await runtime.calculate(command.feePayer),
    "recentBlockhash": await runtime.calculate(command.recentBlockhash),
    "signatures": await runtime.calculate(command.signatures),
    "instructions": await runtime.calculate(command.instructions),
  };

  runtime.memory.write(command.variable, data);
}
