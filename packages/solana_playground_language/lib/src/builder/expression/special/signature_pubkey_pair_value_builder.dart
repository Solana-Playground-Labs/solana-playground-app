import 'package:solana_playground_language/solana_playground_language.dart';

class SignaturePubkeyParsMetaValueBuilder extends MetaValueBuilder {
  ExpressionBuilder publicKey;
  ExpressionBuilder signature;

  SignaturePubkeyParsMetaValueBuilder({
    required this.publicKey,
    required this.signature,
  });

  @override
  JsonValue build() {
    return JsonValue(data: {
      "publicKey": publicKey.build(),
      "signature": signature.build(),
    });
  }

  @override
  SignaturePubkeyParsMetaValueBuilder clone() {
    return SignaturePubkeyParsMetaValueBuilder(
      publicKey: publicKey,
      signature: signature,
    );
  }
}
