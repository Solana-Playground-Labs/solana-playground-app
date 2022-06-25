/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<dynamic> calculateAccountValue(
  SPRuntime runtime,
  AccountValue value,
) async {
  dynamic pubkey = await runtime.calculate(value.pubkey);
  final bool isSigner = await runtime.calculate(value.isSigner);
  final bool isWritable = await runtime.calculate(value.isWritable);

  if (pubkey is String) {
    pubkey = Ed25519HDPublicKey.fromBase58(pubkey);
  } else if (pubkey is Uint8List) {
    pubkey = Ed25519HDPublicKey(pubkey);
  }

  return AccountMeta(
    pubKey: pubkey,
    isWriteable: isWritable,
    isSigner: isSigner,
  );
}
