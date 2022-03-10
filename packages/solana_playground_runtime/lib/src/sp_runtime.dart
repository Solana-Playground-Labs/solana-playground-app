import 'package:solana_playground_language/lib.dart';

import '../solana_playground_runtime.dart';

class SPRuntime {
  final SPMemory _memory = SPMemory();
  final SPConsole console = SPConsole();

  dynamic _result;

  dynamic get result => _result;

  SPMemory get memory => _memory;

  Future<void> execute(Command command) async {
    if (command is BlockCommand) {
      await executeBlockCommand(this, command);
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
}
