import 'package:solana_playground_language/src/core/expression/value.dart';

class SignaturePubkeyPairsValue extends Value {
  final List<SignaturePubkeyPairValue> pairs;

  const SignaturePubkeyPairsValue({required this.pairs});

  @override
  List<Object> get props => [pairs];
}

class SignaturePubkeyPairValue extends Value {
  final String publicKey;
  final String signature;

  const SignaturePubkeyPairValue({
    required this.publicKey,
    required this.signature,
  });

  @override
  List<Object> get props => [publicKey, signature];
}
