import 'package:solana_playground_language/src/core/expression/expression.dart';

import 'command.dart';

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