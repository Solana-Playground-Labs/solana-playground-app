/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

// Future<void> executeCreateTransactionCommand(
//   SPRuntime runtime,
//   CreateTransactionCommand command,
// ) async {
//   final data = {
//     "feePayer": await runtime.calculate(command.feePayer),
//     "recentBlockhash": await runtime.calculate(command.recentBlockhash),
//     "signatures": await runtime.calculate(command.signers),
//     "instructions": await runtime.calculate(command.instructions),
//   };
//
//   runtime.memory.write(command.variable, data);
// }
