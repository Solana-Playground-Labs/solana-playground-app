// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wait_transaction_confirmation_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class WaitTransactionConfirmationCommandBuilder extends CommandBuilder {
  final ExpressionBuilder transaction;

  WaitTransactionConfirmationCommandBuilder({
    required this.transaction,
  });

  @override
  WaitTransactionConfirmationCommand build() {
    return WaitTransactionConfirmationCommand(
      transaction: transaction.build(),
    );
  }

  @override
  WaitTransactionConfirmationCommandBuilder clone() {
    return WaitTransactionConfirmationCommandBuilder(
      transaction: transaction.clone(),
    );
  }
}

WaitTransactionConfirmationCommand _$WaitTransactionConfirmationCommandFromJson(
    Map<String, dynamic> json) {
  return WaitTransactionConfirmationCommand(
    transaction: Expression.fromJson(json['transaction']),
  );
}

Map<String, dynamic> _$WaitTransactionConfirmationCommandToJson(
    WaitTransactionConfirmationCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'transaction': value.transaction.toJson(),
  };
}

WaitTransactionConfirmationCommandBuilder
    _$WaitTransactionConfirmationCommandToBuilder(
        WaitTransactionConfirmationCommand value) {
  return WaitTransactionConfirmationCommandBuilder(
      transaction: value.transaction.asBuilder());
}
