/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';

Future<void> executePrintCommand(
  SPRuntime runtime,
  PrintCommand printCommand,
) async {
  final r = await runtime.calculate(printCommand.expression);

  if (r is List) {
    runtime.console.write(r.join(" "));
  } else {
    runtime.console.write(r.toString());
  }
}
