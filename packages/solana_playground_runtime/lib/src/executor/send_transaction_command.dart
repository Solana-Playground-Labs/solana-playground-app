/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana/dto.dart' hide Instruction;
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeSendTransactionCommand(
  SPRuntime runtime,
  SendTransactionCommand command,
) async {
  final SignedTx signedTx = await runtime.calculate(command.transaction);

  try {
    final id = await runtime.solanaClient.rpcClient.sendTransaction(signedTx.encode());

    runtime.memory.write(command.variable, id);
  } catch (e) {
    rethrow;
  }
}
