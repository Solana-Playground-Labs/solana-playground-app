/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';
import 'parser.dart';

Future<dynamic> calculateListValue(
  SPRuntime runtime,
  ListValue listValue,
) async {
  final result = [];
  for (final e in listValue.expressions) {
    result.add(await runtime.calculate(e));
  }
  return result;
}
