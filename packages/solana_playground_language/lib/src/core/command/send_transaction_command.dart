import 'package:solana_playground_language/lib.dart';

class SendTransactionCommand extends Command {
  final Expression expression;
  final String variable;

  const SendTransactionCommand({
    required this.expression,
    required this.variable,
  });

  @override
  List<Object> get props => [expression, variable];
}
