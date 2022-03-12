import 'package:solana/dto.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeGetRecentBlockHashCommand(
  SPRuntime runtime,
  GetRecentBlockHashCommand command,
) async {
  final result = await runtime.solanaClient.rpcClient
      .getRecentBlockhash(commitment: Commitment.confirmed);
  runtime.memory.write(command.variable, result.blockhash);
}
