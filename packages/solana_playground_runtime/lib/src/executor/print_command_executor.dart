import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';

Future<void> executePrintCommand(
    SPRuntime runtime,
    PrintCommand printCommand,
    ) async {
  final r = await runtime.calculate(printCommand.expression);
  runtime.console.write(r);
}
