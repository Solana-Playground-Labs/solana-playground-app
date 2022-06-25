// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_simple_transaction.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class MakeSimpleTransactionBuilder extends CommandBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  final ExpressionBuilder recentBlockHash;
  final ExpressionBuilder feePayer;
  final ExpressionBuilder instructions;
  final ExpressionBuilder signers;

  MakeSimpleTransactionBuilder({
    required String variable,
    required this.recentBlockHash,
    required this.feePayer,
    required this.instructions,
    required this.signers,
  }) : _variable = variable;

  @override
  MakeSimpleTransaction build() {
    return MakeSimpleTransaction(
      variable: variable,
      recentBlockHash: recentBlockHash.build(),
      feePayer: feePayer.build(),
      instructions: instructions.build(),
      signers: signers.build(),
    );
  }

  @override
  MakeSimpleTransactionBuilder clone() {
    return MakeSimpleTransactionBuilder(
      variable: variable,
      recentBlockHash: recentBlockHash.clone(),
      feePayer: feePayer.clone(),
      instructions: instructions.clone(),
      signers: signers.clone(),
    );
  }
}

MakeSimpleTransaction _$MakeSimpleTransactionFromJson(Map<String, dynamic> json) {
  return MakeSimpleTransaction(
    variable: json['variable'],
    recentBlockHash: Expression.fromJson(json['recentBlockHash']),
    feePayer: Expression.fromJson(json['feePayer']),
    instructions: Expression.fromJson(json['instructions']),
    signers: Expression.fromJson(json['signers']),
  );
}

Map<String, dynamic> _$MakeSimpleTransactionToJson(MakeSimpleTransaction value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
    'recentBlockHash': value.recentBlockHash.toJson(),
    'feePayer': value.feePayer.toJson(),
    'instructions': value.instructions.toJson(),
    'signers': value.signers.toJson(),
  };
}

MakeSimpleTransactionBuilder _$MakeSimpleTransactionToBuilder(MakeSimpleTransaction value) {
  return MakeSimpleTransactionBuilder(
      variable: value.variable,
      recentBlockHash: value.recentBlockHash.asBuilder(),
      feePayer: value.feePayer.asBuilder(),
      instructions: value.instructions.asBuilder(),
      signers: value.signers.asBuilder());
}
