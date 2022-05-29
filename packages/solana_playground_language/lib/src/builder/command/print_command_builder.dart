/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class PrintCommandBuilder extends CommandBuilder {
  ExpressionBuilder expression;

  PrintCommandBuilder({required this.expression});

  factory PrintCommandBuilder.empty() {
    return PrintCommandBuilder(
      expression: ExpressionBuilder(
        valueBuilder: ListValueBuilder(expressions: []),
      ),
    );
  }

  @override
  PrintCommand build() {
    return PrintCommand(
      expression: expression.build(),
    );
  }

  @override
  CommandBuilder clone() {
    return PrintCommandBuilder(expression: expression.clone());
  }
}
