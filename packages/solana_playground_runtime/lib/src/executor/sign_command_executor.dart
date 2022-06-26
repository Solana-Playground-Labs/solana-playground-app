/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/solana_playground_runtime.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeSignCommand(
  SPRuntime runtime,
  SignCommand command,
) async {
  final CompiledMessage compiledMessage = await runtime.calculate(command.transaction);

  // Prepare rawSigners
  var rawSigners = await runtime.calculate(command.signers);
  if (rawSigners is! List) {
    rawSigners = [rawSigners];
  }
  List<Ed25519HDKeyPair> signers = [];
  for (var pubkey in rawSigners) {
    if (pubkey is String) {
      pubkey = Ed25519HDPublicKey.fromBase58(pubkey);
    }

    signers.add(await Ed25519HDKeyPair.fromPrivateKeyBytes(
        privateKey: await runtime.memory.keypairStorage.read(pubkey)));
  }

  // Sign
  final int requiredSignaturesCount = compiledMessage.requiredSignatureCount;
  if (signers.length != requiredSignaturesCount) {
    throw FormatException(
      'your message requires $requiredSignaturesCount signatures but '
      'you provided ${signers.length}',
    );
  }

  // FIXME(IA): signatures must match rawSigners in the message accounts sorting
  final List<Signature> signatures = await Future.wait(
    signers.map((signer) => signer.sign(compiledMessage.data)),
  );

  final signedTx = SignedTx(
    messageBytes: compiledMessage.data,
    signatures: signatures,
  );

  print(signedTx.encode());

  runtime.memory.write(command.variable, signedTx);
}
