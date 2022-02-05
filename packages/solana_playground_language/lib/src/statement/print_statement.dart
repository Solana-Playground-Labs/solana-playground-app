import 'package:solana_playground_language/src/type/type.dart';

import 'abstract_statement.dart';

class PrintStatement extends Statement {

  @override
  InternalType get returnType => const InternalVoid();
}
