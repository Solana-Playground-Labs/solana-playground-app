/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana/dto.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeWaitTransactionConfirmation(
  SPRuntime runtime,
  WaitTransactionConfirmationCommand command,
) async {
  final value = await runtime.calculate(command.expression);
  await runtime.solanaClient.waitForSignatureStatus(
    value,
    status: Commitment.finalized,
  );
}
