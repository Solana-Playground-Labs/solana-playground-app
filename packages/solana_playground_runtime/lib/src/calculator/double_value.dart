/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';
import 'parser.dart';

Future<dynamic> calculateDoubleValue(
  SPRuntime runtime,
  DoubleValue doubleValue,
) async {
  return doubleValue.value;
}
