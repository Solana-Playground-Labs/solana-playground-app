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
  final data = await runtime.calculate(command.transaction);

  final recentBlockhash = data["recentBlockhash"];
  final signers = data['signers'];
  final feePayer = data["feePayer"];

  final message = Message(
    instructions: List.castFrom(data["instructions"]
        .map(
          (e) => _InstructionParser.fromMap(Map.castFrom(e)),
        )
        .toList()),
  );

  // final signers = [];

  final signedTx = await signTransaction(
      RecentBlockhash(
        blockhash: recentBlockhash,
        feeCalculator: const FeeCalculator(lamportsPerSignature: 500),
      ),
      message,
      [
        await Ed25519HDKeyPair.fromPrivateKeyBytes(
            privateKey: feePayer['privateKey']),
      ]);

  try {
    final id =
        await runtime.solanaClient.rpcClient.sendTransaction(signedTx.encode());

    runtime.memory.write(command.variable, id);
  } catch (e) {
    rethrow;
  }
}

extension _InstructionParser on Instruction {
  static Instruction fromMap(Map<String, dynamic> data) {
    return Instruction(
      programId: data["programId"],
      accounts: List.castFrom(data["keys"].map((e) {
        return AccountMeta(
          pubKey: e["pubkey"],
          isWriteable: e["isWritable"],
          isSigner: e["isSigner"],
        );
      }).toList()),
      data: data["data"],
    );
  }
}
