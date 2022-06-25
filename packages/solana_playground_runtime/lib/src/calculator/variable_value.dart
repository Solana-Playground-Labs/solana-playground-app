/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/calculator/parser.dart';

import '../sp_runtime.dart';

Future<dynamic> calculateVariableValue(
  SPRuntime runtime,
  VariableValue variableValue,
) async {
  final indexRegex = RegExp(r'\[(.*?)\]');
  final matches = indexRegex.allMatches(variableValue.variable);

  final variable = variableValue.variable.replaceAll(indexRegex, "");
  var value = runtime.memory.read(variable);
  for (final match in matches) {
    final index = valueParse(
      variableValue.variable.substring(match.start + 1, match.end - 1),
    );
    value = value[index];
  }
  return value;
}
