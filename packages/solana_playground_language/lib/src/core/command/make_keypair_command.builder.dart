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

  ExpressionBuilder _publicKey;

  ExpressionBuilder get publicKey => _publicKey;

  set publicKey(ExpressionBuilder value) {
    _publicKey = value;
    notifyListeners();
  }

  ExpressionBuilder _privateKey;

  ExpressionBuilder get privateKey => _privateKey;

  set privateKey(ExpressionBuilder value) {
    _privateKey = value;
    notifyListeners();
  }

  MakeKeyPairCommandBuilder({
    required String variable,
    required ExpressionBuilder publicKey,
    required ExpressionBuilder privateKey,
  })  : _variable = variable,
        _publicKey = publicKey,
        _privateKey = privateKey;

  @override
  MakeKeyPairCommand build() {
    return MakeKeyPairCommand(
      variable: variable,
      publicKey: publicKey,
      privateKey: privateKey,
    );
  }

  @override
  MakeKeyPairCommandBuilder clone() {
    return MakeKeyPairCommandBuilder(
      variable: variable,
      publicKey: publicKey,
      privateKey: privateKey,
    );
  }
}

MakeKeyPairCommand _$MakeKeyPairCommandFromJson(Map<String, dynamic> json) {
  return MakeKeyPairCommand(
    variable: json['variable'],
    publicKey: json['publicKey'],
    privateKey: json['privateKey'],
  );
}

Map<String, dynamic> _$MakeKeyPairCommandToJson(MakeKeyPairCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
    'publicKey': value.publicKey,
    'privateKey': value.privateKey,
  };
}

MakeKeyPairCommandBuilder _$MakeKeyPairCommandToBuilder(MakeKeyPairCommand value) {
  return MakeKeyPairCommandBuilder(
      variable: value.variable, publicKey: value.publicKey, privateKey: value.privateKey);
}
