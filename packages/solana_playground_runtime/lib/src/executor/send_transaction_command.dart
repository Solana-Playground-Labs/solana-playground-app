import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeSendTransactionCommand(
  SPRuntime runtime,
  SendTransactionCommand command,
) async {
  final data = await runtime.calculate(command.expression);

  final recentBlockhash = data["recentBlockhash"];
  final feePayer = data["feePayer"];

  final message = Message(
    instructions: data["instructions"]
        .map(
          (e) => _InstructionParser.fromMap(e),
        )
        .toList(),
  );

  final signedTx = await signTransaction(recentBlockhash, message, [
    feePayer,
  ]);

  final id = await runtime.solanaClient.rpcClient.sendTransaction(
    signedTx.encode(),
  );

  runtime.memory.write(command.variable, id);
}

extension _InstructionParser on Instruction {
  static Instruction fromMap(Map<String, dynamic> data) {
    return Instruction(
      programId: data["programId"],
      accounts: data["accounts"].map((e) {
        return AccountMeta(
          pubKey: e["pubKey"],
          isWriteable: e["isWriteable"],
          isSigner: e["isSigner"],
        );
      }),
      data: data["data"],
    );
  }
}
