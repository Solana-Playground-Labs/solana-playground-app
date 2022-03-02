import 'package:solana_playground_language/src/core/expression/expression.dart';
import 'package:solana_playground_language/src/core/expression/special/account_meta_value.dart';
import 'package:solana_playground_language/src/core/expression/value.dart';

class TransactionInstructionValue extends Value {
  final Expression programId;
  final AccountMetasValue keys;
  final Expression data;

  const TransactionInstructionValue({
    required this.programId,
    required this.keys,
    required this.data,
  });

  @override
  List<Object> get props => [programId, keys, data];
}