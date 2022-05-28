/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

@Deprecated("Will be removed")
class SignaturePubkeyParsMetaValueBuilder extends MetaValueBuilder {
  ExpressionBuilder publicKey;
  ExpressionBuilder signature;

  SignaturePubkeyParsMetaValueBuilder({
    required this.publicKey,
    required this.signature,
  });

  factory SignaturePubkeyParsMetaValueBuilder.fromJsonValue(JsonValueBuilder jsonValue) {
    jsonValue.data["publicKey"] ??= ExpressionBuilder.withConstantValue();
    jsonValue.data["signature"] ??= ExpressionBuilder.withConstantValue();

    return SignaturePubkeyParsMetaValueBuilder(
      publicKey: jsonValue.data["publicKey"],
      signature: jsonValue.data["signature"],
    );
  }

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
