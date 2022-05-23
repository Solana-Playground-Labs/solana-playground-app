/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

@Deprecated("Will be removed")
class SendTransactionCommand extends Command {
  final Expression expression;
  final String variable;

  const SendTransactionCommand({
    required this.expression,
    required this.variable,
  });

  @override
  List<Object> get props => [expression, variable];

  factory SendTransactionCommand.fromJson(Map<String, dynamic> json) {
    return SendTransactionCommand(
        variable: json['variable'],
        expression: Expression.fromJson(json['expression']));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'variable': variable,
      'expression': expression.toJson(),
    };
  }

  @override
  CommandBuilder asBuilder() {
    return SendTransactionCommandBuilder(
      expressionBuilder: expression.asBuilder(),
      variable: variable,
    );
  }
}
