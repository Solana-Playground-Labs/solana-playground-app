import 'package:solana_playground_language/src/type/type.dart';
import 'package:solana_playground_language/src/types.dart';

import 'abstract_statement.dart';

class SendTransactionStatement extends Statement {
  final Variable variable;
  final InternalType variableType = const InternalObject(TransactionSchema());

  const SendTransactionStatement({required this.variable});

  @override
  InternalType get returnType => const InternalString();
}
