import 'package:solana_playground_language/solana_playground_language.dart';

class CreateSignaturePubkeyPairStatement extends BaseStatement {
  final BaseValue publicKey;
  final BaseValue signature;

  const CreateSignaturePubkeyPairStatement({
    required this.publicKey,
    required this.signature,
  });

  @override
  List<Object> get props => [publicKey, signature];
}