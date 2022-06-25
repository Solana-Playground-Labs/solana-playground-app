// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class SignCommandBuilder extends CommandBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  final ExpressionBuilder signers;
  final ExpressionBuilder transaction;

  SignCommandBuilder({
    required String variable,
    required this.signers,
    required this.transaction,
  }) : _variable = variable;

  @override
  SignCommand build() {
    return SignCommand(
      variable: variable,
      signers: signers.build(),
      transaction: transaction.build(),
    );
  }

  @override
  SignCommandBuilder clone() {
    return SignCommandBuilder(
      variable: variable,
      signers: signers.clone(),
      transaction: transaction.clone(),
    );
  }
}

SignCommand _$SignCommandFromJson(Map<String, dynamic> json) {
  return SignCommand(
    variable: json['variable'],
    signers: Expression.fromJson(json['signers']),
    transaction: Expression.fromJson(json['transaction']),
  );
}

Map<String, dynamic> _$SignCommandToJson(SignCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
    'signers': value.signers.toJson(),
    'transaction': value.transaction.toJson(),
  };
}

SignCommandBuilder _$SignCommandToBuilder(SignCommand value) {
  return SignCommandBuilder(
      variable: value.variable,
      signers: value.signers.asBuilder(),
      transaction: value.transaction.asBuilder());
}
