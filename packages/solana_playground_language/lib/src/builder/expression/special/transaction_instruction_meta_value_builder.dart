import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/builder/expression/binary_value_builder.dart';
import 'package:solana_playground_language/src/builder/expression/special/account_meta_value_builder.dart';

class InstructionMetaValueBuilder extends MetaValueBuilder {
  ExpressionBuilder programId;
  ListBuilder<AccountMetaValueBuilder> keys;
  BinaryValueBuilder binaryValueBuilder;

  InstructionMetaValueBuilder({
    required this.programId,
    required this.keys,
    required this.binaryValueBuilder,
  });

  factory InstructionMetaValueBuilder.empty() {
    return InstructionMetaValueBuilder(
      programId: ExpressionBuilder.withConstantValue(),
      keys: ListBuilder.empty(),
      binaryValueBuilder: BinaryValueBuilder(data: Uint8List.fromList([])),
    );
  }

  @override
  Value build() {
    return JsonValue(
      data: {
        "programId": programId.build(),
        "keys": keys.map((e) => e.build()).toList(),
        "binaryValueBuilder": binaryValueBuilder,
      },
    );
  }

  @override
  Builder clone() {
    return InstructionMetaValueBuilder(
      programId: programId,
      keys: keys,
      binaryValueBuilder: binaryValueBuilder,
    );
  }
}
