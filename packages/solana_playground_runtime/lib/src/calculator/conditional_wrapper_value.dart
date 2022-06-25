/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';

Future<dynamic> calculateConditionalWrapperValue(
  SPRuntime runtime,
  ConditionalWrapperValue value,
) async {
  final condition = await runtime.calculate(value.condition);

  return condition == true
      ? await runtime.calculate(value.trueFlow)
      : await runtime.calculate(value.falseFlow);
}
