import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';

Future<dynamic> calculateVariableValue(
    SPRuntime runtime,
    VariableValue constantValue,
    ) async {
  return runtime.memory.read(constantValue.variable);
}
