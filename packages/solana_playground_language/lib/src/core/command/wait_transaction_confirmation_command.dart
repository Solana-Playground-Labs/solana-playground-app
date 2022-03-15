import 'package:solana_playground_language/lib.dart';

class WaitTransactionConfirmationCommand extends Command {
  final Expression expression;

  const WaitTransactionConfirmationCommand({
    required this.expression,
  });

  @override
  List<Object?> get props => [expression];

  factory WaitTransactionConfirmationCommand.fromJson(
      Map<String, dynamic> json) {
    return WaitTransactionConfirmationCommand(
        expression: Expression.fromJson(json['expression']));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'expression': expression.toJson(),
    };
  }
}
