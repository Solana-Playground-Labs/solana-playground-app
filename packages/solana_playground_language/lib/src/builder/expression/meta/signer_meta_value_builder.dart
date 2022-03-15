/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class SignerMetaValueBuilder extends MetaValueBuilder {
  JsonValueBuilder builder;

  ExpressionBuilder get pubKey => builder.data["pubKey"];

  ExpressionBuilder get privateKey => builder.data["privateKey"];

  SignerMetaValueBuilder({required this.builder}) {
    builder.data["pubKey"] ??= ExpressionBuilder.withConstantValue();
    builder.data["privateKey"] ??= ExpressionBuilder.withConstantValue();
  }

  @override
  Value build() {
    return JsonValue(data: {
      "pubKey": pubKey.build(),
      "privateKey:": privateKey.build(),
    });
  }

  @override
  Builder clone() {
    return SignerMetaValueBuilder(builder: builder.clone());
  }
}
