import 'package:solana_playground_language/src/core/expression/abstract_expression.dart';

import 'abstract_command.dart';

class DeclareVariableCommand extends Command {
  final String variable;
  final Expression expression;

  const DeclareVariableCommand({
    required this.variable,
    required this.expression,
  });

  @override
  List<Object> get props => [variable, expression];

  factory DeclareVariableCommand.fromJson(Map<String, dynamic> json) {
    return DeclareVariableCommand(
      variable: json['variable'],
      expression: Expression.fromJson(json['expression']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'variable': variable,
      'expression': expression.toJson(),
    };
  }
}
