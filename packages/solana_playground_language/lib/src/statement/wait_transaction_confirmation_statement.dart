import 'package:solana_playground_language/solana_playground_language.dart';

class WaitTransactionConfirmation extends Statement {
  final VariableValue signature;

  const WaitTransactionConfirmation({required this.signature});

  @override
  InternalType get returnType => const InternalBool();
}
