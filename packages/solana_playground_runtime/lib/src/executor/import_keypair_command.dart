/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeImportKeypairCommand(
  SPRuntime runtime,
  ImportKeypairFromStorageCommand command,
) async {
  final String walletName = await runtime.calculate(command.walletName);
  final keypair = await runtime.keypairProvider.get(walletName);

  await runtime.memory.keypairStorage.write(keypair.publicKey, keypair.privateKey);
  runtime.memory.write(command.variable, keypair.publicKey);
}
