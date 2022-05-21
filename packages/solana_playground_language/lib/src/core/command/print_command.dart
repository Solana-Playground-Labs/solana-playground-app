/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/command/command_builder.dart';
import 'package:solana_playground_language/src/core/command/abstract_command.dart';
import 'package:solana_playground_language/src/core/expression/abstract_expression.dart';

class PrintCommand extends Command {
  final List<Expression> expressions;

  const PrintCommand({required this.expressions});

  @override
  List<Object> get props => [expressions];

  factory PrintCommand.fromJson(Map<String, dynamic> json) {
    return PrintCommand(
      expressions: json['expressions'].map((data) => Expression.fromJson(data)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'expression': expressions.map((e) => e.toJson()),
    };
  }

  @override
  PrintCommandBuilder asBuilder() {
    return PrintCommandBuilder(
      expressions: ListBuilder(expressions.map((e) => e.asBuilder()).toList()),
    );
  }
}
