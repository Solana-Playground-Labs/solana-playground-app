/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class TransactionInstructionMetaValueBuilder extends MetaValueBuilder {
  JsonValueBuilder builder;

  ExpressionBuilder get programId => builder.data['programId'];

  ExpressionBuilder get keys => builder.data['keys'];

  ExpressionBuilder get data => builder.data['data'];

  ExpressionBuilder get condition => builder.data['condition'];

  TransactionInstructionMetaValueBuilder({required this.builder}) {
    builder.data['programId'] ??= ExpressionBuilder.withConstantValue();
    builder.data['keys'] ??= ExpressionBuilder.withJson(data: []);
    builder.data['data'] ??= ExpressionBuilder.withBinaryValue();
    builder.data['condition'] ??=
        ExpressionBuilder.withConstantValue(value: "true");
  }

  @override
  Value build() {
    return JsonValue(
      data: {
        "programId": programId.build(),
        "keys": keys.build(),
        "binaryValueBuilder": data.build(),
      },
    );
  }

  @override
  Builder clone() {
    return TransactionInstructionMetaValueBuilder(
      builder: builder.clone(),
    );
  }
}
