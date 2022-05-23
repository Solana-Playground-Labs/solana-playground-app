/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

import 'meta_value_builder.dart';

class AccountMetaValueBuilder extends MetaValueBuilder {
  JsonValueBuilder builder;

  ExpressionBuilder get isSigner => builder.data["isSigner"];

  ExpressionBuilder get isWritable => builder.data["isWritable"];

  ExpressionBuilder get pubkey => builder.data["pubkey"];

  AccountMetaValueBuilder({
    required this.builder,
  }) {
    builder.data["pubkey"] ??=
        ExpressionBuilder.withConstantValue();
    builder.data["isSigner"] ??=
        ExpressionBuilder(valueBuilder: JsonValueBuilder(data: false));
    builder.data["isWritable"] ??=
        ExpressionBuilder(valueBuilder: JsonValueBuilder(data: false));
  }

  @override
  Value build() {
    return JsonValue(data: {
      "isSigner": isSigner.build(),
      "isWritable": isWritable.build(),
      "pubkey": pubkey.build(),
    });
  }

  @override
  Builder clone() {
    return AccountMetaValueBuilder(builder: builder.clone());
  }
}
