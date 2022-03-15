/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

import 'meta_value_builder.dart';

class AccountMetaValueBuilder extends MetaValueBuilder {
  final ExpressionBuilder isSigner;
  final ExpressionBuilder isWritable;
  final ExpressionBuilder pubkey;

  AccountMetaValueBuilder({
    required this.isSigner,
    required this.isWritable,
    required this.pubkey,
  });

  factory AccountMetaValueBuilder.fromJsonValue(JsonValueBuilder jsonValue) {
    jsonValue.data["isSigner"] ??= ExpressionBuilder.withConstantValue();
    jsonValue.data["isWritable"] ??= ExpressionBuilder.withConstantValue();
    jsonValue.data["pubkey"] ??= ExpressionBuilder.withConstantValue();

    return AccountMetaValueBuilder(
      isSigner: jsonValue.data["isSigner"],
      isWritable: jsonValue.data["isWritable"],
      pubkey: jsonValue.data["pubkey"],
    );
  }

  @override
  Value build() {
    return JsonValue(data: {
      "isSigner": isSigner,
      "isWritable": isWritable,
      "pubkey": pubkey,
    });
  }

  @override
  Builder clone() {
    return AccountMetaValueBuilder(
      isSigner: isSigner,
      isWritable: isWritable,
      pubkey: pubkey,
    );
  }
}
