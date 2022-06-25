/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeCreateSplAssociatedTokenAccount(
  SPRuntime runtime,
  CreateSplAssociatedTokenAccountCommand command,
) async {
  var address = await runtime.calculate(command.baseAddress);
  final mint = await runtime.calculate(command.mintAddress);

  if (address is String) {
    address = Ed25519HDPublicKey.fromBase58(address);
  }

  final pda = Ed25519HDPublicKey.findProgramAddress(
    seeds: [
      parseAddress(address),
      parseAddress(TokenProgram.id),
      parseAddress(mint),
    ],
    programId: AssociatedTokenAccountProgram.id,
  );

  runtime.memory.write(command.variable, pda);
}

List<int> parseAddress(input) {
  if (input is String) {
    return Ed25519HDPublicKey.fromBase58(input).bytes;
  } else if (input is Ed25519HDPublicKey) {
    return input.bytes;
  }

  return input;
}
