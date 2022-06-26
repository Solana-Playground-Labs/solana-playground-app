// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transaction_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class SendTransactionCommandBuilder extends CommandBuilder {
  final ExpressionBuilder transaction;
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  SendTransactionCommandBuilder({
    required this.transaction,
    required String variable,
  }) : _variable = variable;

  @override
  SendTransactionCommand build() {
    return SendTransactionCommand(
      transaction: transaction.build(),
      variable: variable,
    );
  }

  @override
  SendTransactionCommandBuilder clone() {
    return SendTransactionCommandBuilder(
      transaction: transaction.clone(),
      variable: variable,
    );
  }
}

SendTransactionCommand _$SendTransactionCommandFromJson(
    Map<String, dynamic> json) {
  return SendTransactionCommand(
    transaction: Expression.fromJson(json['transaction']),
    variable: json['variable'],
  );
}

Map<String, dynamic> _$SendTransactionCommandToJson(
    SendTransactionCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'transaction': value.transaction.toJson(),
    'variable': value.variable,
  };
}

SendTransactionCommandBuilder _$SendTransactionCommandToBuilder(
    SendTransactionCommand value) {
  return SendTransactionCommandBuilder(
      transaction: value.transaction.asBuilder(), variable: value.variable);
}
