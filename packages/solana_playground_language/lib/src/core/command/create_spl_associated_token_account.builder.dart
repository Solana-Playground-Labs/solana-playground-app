// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_spl_associated_token_account.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class CreateSplAssociatedTokenAccountCommandBuilder extends CommandBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  final ExpressionBuilder baseAddress;
  final ExpressionBuilder mintAddress;

  CreateSplAssociatedTokenAccountCommandBuilder({
    required String variable,
    required this.baseAddress,
    required this.mintAddress,
  }) : _variable = variable;

  @override
  CreateSplAssociatedTokenAccountCommand build() {
    return CreateSplAssociatedTokenAccountCommand(
      variable: variable,
      baseAddress: baseAddress.build(),
      mintAddress: mintAddress.build(),
    );
  }

  @override
  CreateSplAssociatedTokenAccountCommandBuilder clone() {
    return CreateSplAssociatedTokenAccountCommandBuilder(
      variable: variable,
      baseAddress: baseAddress.clone(),
      mintAddress: mintAddress.clone(),
    );
  }
}

CreateSplAssociatedTokenAccountCommand _$CreateSplAssociatedTokenAccountCommandFromJson(
    Map<String, dynamic> json) {
  return CreateSplAssociatedTokenAccountCommand(
    variable: json['variable'],
    baseAddress: Expression.fromJson(json['baseAddress']),
    mintAddress: Expression.fromJson(json['mintAddress']),
  );
}

Map<String, dynamic> _$CreateSplAssociatedTokenAccountCommandToJson(
    CreateSplAssociatedTokenAccountCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
    'baseAddress': value.baseAddress.toJson(),
    'mintAddress': value.mintAddress.toJson(),
  };
}

CreateSplAssociatedTokenAccountCommandBuilder _$CreateSplAssociatedTokenAccountCommandToBuilder(
    CreateSplAssociatedTokenAccountCommand value) {
  return CreateSplAssociatedTokenAccountCommandBuilder(
      variable: value.variable,
      baseAddress: value.baseAddress.asBuilder(),
      mintAddress: value.mintAddress.asBuilder());
}
