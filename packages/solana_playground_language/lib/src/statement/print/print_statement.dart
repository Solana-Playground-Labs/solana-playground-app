import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/type/type.dart';

import '../base_statement.dart';

class PrintStatement extends BaseStatement {
  final List<BaseValue> variables;

  const PrintStatement({required this.variables});

  @override
  InternalType get returnType => const InternalVoid();
}
