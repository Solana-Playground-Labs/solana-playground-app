/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

@Deprecated("Will be removed")
class WaitTransactionConfirmationCommand extends Command {
  final Expression expression;

  const WaitTransactionConfirmationCommand({
    required this.expression,
  });

  @override
  List<Object?> get props => [expression];

  factory WaitTransactionConfirmationCommand.fromJson(
      Map<String, dynamic> json) {
    return WaitTransactionConfirmationCommand(
        expression: Expression.fromJson(json['expression']));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'expression': expression.toJson(),
    };
  }

  @override
  WaitConfirmationCommandBuilder asBuilder() {
    return WaitConfirmationCommandBuilder(
      expressionBuilder: expression.asBuilder(),
    );
  }
}
