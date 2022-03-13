import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeImportWalletCommand(
  SPRuntime runtime,
  ImportWalletCommand command,
) async {
  final walletName = await runtime.calculate(command.walletName);
  final wallet = await runtime.walletProvider.get(walletName);
  runtime.memory.write(command.variable, wallet);
}
