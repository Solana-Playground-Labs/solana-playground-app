import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeDeclareVariable(
  SPRuntime runtime,
  DeclareVariableCommand command,
) async {
  runtime.memory.set(
    command.variable,
    await runtime.calculate(command.expression),
  );
}
