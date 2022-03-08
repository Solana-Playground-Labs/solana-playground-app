import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/command/send_transaction_command.dart';

class SendTransactionCommandBuilder extends CommandBuilder {
  final ExpressionBuilder expressionBuilder;
  String _variable;

  SendTransactionCommandBuilder({
    required this.expressionBuilder,
    required String variable,
  }) : _variable = variable;

  factory SendTransactionCommandBuilder.empty() {
    return SendTransactionCommandBuilder(
      expressionBuilder: ExpressionBuilder.withVariable(),
      variable: "",
    );
  }

  String get variable => _variable;

  set variable(String variable) {
    _variable = variable;
    notifyListeners();
  }

  @override
  Command build() {
    return SendTransactionCommand(
      expressionBuilder: expressionBuilder.build(),
      variable: variable,
    );
  }

  @override
  CommandBuilder clone() {
    return SendTransactionCommandBuilder(
      expressionBuilder: expressionBuilder.clone(),
      variable: variable,
    );
  }
}
