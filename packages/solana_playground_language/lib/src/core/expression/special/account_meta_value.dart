import 'package:solana_playground_language/src/core/expression/expression.dart';
import 'package:solana_playground_language/src/core/expression/value.dart';

class AccountMetasValue extends Value {
  final List<AccountMetaValue> metas;

  const AccountMetasValue({required this.metas});

  @override
  List<Object> get props => [metas];
}

class AccountMetaValue extends Value {
  final Expression isSigner;
  final Expression isWriteable;
  final Expression pubkey;

  const AccountMetaValue({
    required this.isSigner,
    required this.isWriteable,
    required this.pubkey,
  });

  @override
  List<Object> get props => [isSigner, isWriteable, pubkey];
}
