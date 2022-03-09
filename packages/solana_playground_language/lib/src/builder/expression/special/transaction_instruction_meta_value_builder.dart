import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class TransactionInstructionMetaValueBuilder extends MetaValueBuilder {
  JsonValueBuilder builder;

  ExpressionBuilder get programId => builder.data['programId'];

  ListBuilder<dynamic> get keys => ListBuilder(builder.data['keys']);

  ExpressionBuilder get data => builder.data['data'];

  TransactionInstructionMetaValueBuilder({required this.builder}) {
    builder.data['programId'] ??= ExpressionBuilder.withConstantValue();
    builder.data['keys'] ??= [];
    builder.data['data'] ??= ExpressionBuilder.withBinaryValue();
  }

  @override
  Value build() {
    return JsonValue(
      data: {
        "programId": programId.build(),
        "keys": keys.map((e) => e.build()).toList(),
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
