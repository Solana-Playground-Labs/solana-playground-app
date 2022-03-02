import 'package:solana_playground_language/src/core/command/abstract_command.dart';
import 'package:solana_playground_language/src/core/expression/abstract_expression.dart';

class PrintCommand extends Command {
  final Expression expression;

  const PrintCommand({required this.expression});

  @override
  List<Object> get props => [expression];
}
