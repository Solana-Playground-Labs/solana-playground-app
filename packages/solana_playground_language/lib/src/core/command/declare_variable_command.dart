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
}