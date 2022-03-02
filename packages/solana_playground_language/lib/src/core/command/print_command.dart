import 'package:solana_playground_language/src/core/command/command.dart';
import 'package:solana_playground_language/src/core/expression/expression.dart';

class PrintCommand extends Command {
  final Expression expression;

  const PrintCommand({required this.expression});

  @override
  List<Object> get props => [expression];
}
