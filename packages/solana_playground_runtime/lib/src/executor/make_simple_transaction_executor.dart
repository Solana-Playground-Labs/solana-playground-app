/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeMakeSimpleTransaction(
  SPRuntime runtime,
  MakeSimpleTransaction command,
) async {
  final recentBlockhash = await runtime.calculate(command.recentBlockHash);
  final List<Instruction?> instructions =
      List.castFrom(await runtime.calculate(command.instructions));

  var feePayer = await runtime.calculate(command.feePayer);
  if (feePayer is String) {
    feePayer = Ed25519HDPublicKey.fromBase58(feePayer);
  } else if (feePayer is List<int>) {
    feePayer = Ed25519HDPublicKey(feePayer);
  }

  final message =
      Message(instructions: instructions.whereType<Instruction>().toList());
  final compiledMessage = message.compile(
    recentBlockhash: recentBlockhash,
    feePayer: feePayer,
  );

  runtime.memory.write(command.variable, compiledMessage);
}
