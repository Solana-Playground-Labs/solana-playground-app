import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/type/type.dart';

import 'abstract_statement.dart';

class PrintStatement extends Statement {
  final List<Value> variables;

  const PrintStatement({required this.variables});

  @override
  InternalType get returnType => const InternalVoid();
}
