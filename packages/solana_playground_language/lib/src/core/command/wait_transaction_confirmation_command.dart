import 'package:solana_playground_language/lib.dart';

class WaitTransactionConfirmationCommand extends Command {
  final Expression expression;

  const WaitTransactionConfirmationCommand({
    required this.expression,
  });

  @override
  List<Object?> get props => [expression];
}