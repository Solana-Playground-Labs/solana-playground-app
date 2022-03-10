import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';

Future<dynamic> calculateConstantValue(
  SPRuntime runtime,
  ConstantValue constantValue,
) async {
  return constantValue.value;
}
