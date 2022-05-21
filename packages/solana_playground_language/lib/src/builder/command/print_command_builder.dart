/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/abstract_command.dart';
import 'package:solana_playground_language/src/core/command/print_command.dart';
import 'package:solana_playground_language/src/core/expression/abstract_expression.dart';

class PrintCommandBuilder extends CommandBuilder {
  ListBuilder<ExpressionBuilder> expressions;

  PrintCommandBuilder({required this.expressions});

  factory PrintCommandBuilder.empty() {
    return PrintCommandBuilder(
      expressions: ListBuilder([ExpressionBuilder.withVariable()]),
    );
  }

  @override
  PrintCommand build() {
    return PrintCommand(
      expressions: expressions.map((element) => element.build()).toList(),
    );
  }

  @override
  CommandBuilder clone() {
    return PrintCommandBuilder(
      expressions: ListBuilder(
        expressions.map((element) => element.clone()).toList(),
      ),
    );
  }
}
