import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/types.dart';

class WalletLoaderStatement extends BaseStatement {
  final Variable privateKeyVariable;
  final Variable publicKeyVariable;
  final String description;

  const WalletLoaderStatement({
    required this.privateKeyVariable,
    required this.publicKeyVariable,
    required this.description,
  });

  @override
  InternalType get returnType => const InternalVoid();

  @override
  List<Object> get props => [
        privateKeyVariable,
        publicKeyVariable,
        description,
      ];

  WalletLoaderStatement copyWith({
    Variable? privateKeyVariable,
    Variable? publicKeyVariable,
    String? description,
  }) {
    return WalletLoaderStatement(
      privateKeyVariable: privateKeyVariable ?? this.privateKeyVariable,
      publicKeyVariable: publicKeyVariable ?? this.publicKeyVariable,
      description: description ?? this.description,
    );
  }
}
