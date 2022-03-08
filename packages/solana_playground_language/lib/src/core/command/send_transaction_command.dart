import 'package:solana_playground_language/lib.dart';

class SendTransactionCommand extends Command {
  final Expression expressionBuilder;
  final String variable;

  const SendTransactionCommand({
    required this.expressionBuilder,
    required this.variable,
  });

  @override
  List<Object> get props => [expressionBuilder, variable];
}
