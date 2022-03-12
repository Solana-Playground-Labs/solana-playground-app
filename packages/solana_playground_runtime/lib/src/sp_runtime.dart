import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:collection/collection.dart';
import 'package:solana_playground_runtime/src/executor/create_transaction_command.dart';
import 'package:solana_playground_runtime/src/executor/get_recent_block_hash_command.dart';

import '../solana_playground_runtime.dart';

class SPRuntime {
  final SolanaClient solanaClient = SolanaClient(
    rpcUrl: Uri.parse("https://api.devnet.solana.com"),
    websocketUrl: Uri.parse("ws://api.devnet.solana.com"),
  );

  final SPMemory _memory = SPMemory();
  final SPConsole console = SPConsole();

  dynamic _result;

  dynamic get result => _result;

  SPMemory get memory => _memory;

  Future<dynamic> run(Package package) async {
    if (package.packageType != PackageType.application) {
      throw Exception("The package should be application type");
    }

    final mainScript =
        package.scripts.firstWhereOrNull((e) => e.name == 'main');
    if (mainScript == null) {
      throw Exception("Can not find main script");
    }

    return execute(mainScript.blockCommand);
  }

  Future<void> execute(Command command) async {
    if (command is BlockCommand) {
      await executeBlockCommand(this, command);
    } else if (command is DeclareVariableCommand) {
      await executeDeclareVariable(this, command);
    } else if (command is PrintCommand) {
      await executePrintCommand(this, command);
    } else if (command is GetRecentBlockHashCommand) {
      await executeGetRecentBlockHashCommand(this, command);
    } else if (command is CreateTransactionCommand) {
      await executeCreateTransactionCommand(this, command);
    } else {
      throw Exception("Unknown command ${command.runtimeType}");
    }
  }

  Future<dynamic> calculate(Expression expression) async {
    final value = expression.value;
    if (value is ConstantValue) {
      return calculateConstantValue(this, value);
    } else if (value is VariableValue) {
      return calculateVariableValue(this, value);
    } else if (value is BinaryValue) {
      return calculateBinaryValue(this, value);
    } else if (value is JsonValue) {
      return calculateJsonValue(this, value);
    } else {
      return null;
    }
  }

  Future<void> dispose() async {
    await console.dispose();
  }
}
