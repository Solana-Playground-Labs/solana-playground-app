// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_keypair_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class MakeKeyPairCommandBuilder extends CommandBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  final ExpressionBuilder publicKey;
  final ExpressionBuilder privateKey;

  MakeKeyPairCommandBuilder({
    required String variable,
    required this.publicKey,
    required this.privateKey,
  }) : _variable = variable;

  @override
  MakeKeyPairCommand build() {
    return MakeKeyPairCommand(
      variable: variable,
      publicKey: publicKey.build(),
      privateKey: privateKey.build(),
    );
  }

  @override
  MakeKeyPairCommandBuilder clone() {
    return MakeKeyPairCommandBuilder(
      variable: variable,
      publicKey: publicKey.clone(),
      privateKey: privateKey.clone(),
    );
  }
}

MakeKeyPairCommand _$MakeKeyPairCommandFromJson(Map<String, dynamic> json) {
  return MakeKeyPairCommand(
    variable: json['variable'],
    publicKey: Expression.fromJson(json['publicKey']),
    privateKey: Expression.fromJson(json['privateKey']),
  );
}

Map<String, dynamic> _$MakeKeyPairCommandToJson(MakeKeyPairCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
    'publicKey': value.publicKey.toJson(),
    'privateKey': value.privateKey.toJson(),
  };
}

MakeKeyPairCommandBuilder _$MakeKeyPairCommandToBuilder(
    MakeKeyPairCommand value) {
  return MakeKeyPairCommandBuilder(
      variable: value.variable,
      publicKey: value.publicKey.asBuilder(),
      privateKey: value.privateKey.asBuilder());
}
