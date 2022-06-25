/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<dynamic> calculateInstructionValue(
  SPRuntime runtime,
  InstructionValue value,
) async {
  final String programId = await runtime.calculate(value.programId);
  final List<AccountMeta> keys = List.castFrom(
    await runtime.calculate(value.keys),
  );
  final Uint8List data = await runtime.calculate(value.data);

  final instruction = Instruction(
    programId: Ed25519HDPublicKey.fromBase58(programId),
    accounts: keys,
    data: ByteArray(data),
  );

  return instruction;
}
