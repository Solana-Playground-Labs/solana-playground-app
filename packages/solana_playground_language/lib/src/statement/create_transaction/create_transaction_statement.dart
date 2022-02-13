import 'package:solana_playground_language/src/type/type.dart';

import '../base_statement.dart';

class CreateTransactionStatement extends BaseStatement {
  @override
  InternalType get returnType => const InternalObject(TransactionSchema());
}
