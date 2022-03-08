import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/command/wait_transaction_confirmation_command.dart';

class WaitConfirmationCommandBuilder extends CommandBuilder {
  final ExpressionBuilder expressionBuilder;

  WaitConfirmationCommandBuilder({
    required this.expressionBuilder,
  });

  factory WaitConfirmationCommandBuilder.empty() {
    return WaitConfirmationCommandBuilder(
      expressionBuilder: ExpressionBuilder.withVariable(),
    );
  }

  @override
  Command build() {
    return WaitTransactionConfirmationCommand(
      expression: expressionBuilder.build(),
    );
  }

  @override
  CommandBuilder clone() {
    return WaitConfirmationCommandBuilder(
      expressionBuilder: expressionBuilder.clone(),
    );
  }
}
