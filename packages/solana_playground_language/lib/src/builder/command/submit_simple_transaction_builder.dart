/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class SubmitSimpleTransactionBuilder extends CommandBuilder {
  ExpressionBuilder instructions;
  ExpressionBuilder signers;

  SubmitSimpleTransactionBuilder({
    required this.instructions,
    required this.signers,
  });

  factory SubmitSimpleTransactionBuilder.empty() {
    return SubmitSimpleTransactionBuilder(
      instructions:
          ExpressionBuilder(valueBuilder: ListValueBuilder(expressions: [])),
      signers:
          ExpressionBuilder(valueBuilder: ListValueBuilder(expressions: [])),
    );
  }

  @override
  SubmitSimpleTransaction build() {
    return SubmitSimpleTransaction(
      instructions: instructions.build(),
      signers: signers.build(),
    );
  }

  @override
  SubmitSimpleTransactionBuilder clone() {
    return SubmitSimpleTransactionBuilder(
      instructions: instructions.clone(),
      signers: signers.clone(),
    );
  }
}
