// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_keypair_from_storage.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class ImportKeypairFromStorageCommandBuilder extends CommandBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  final ExpressionBuilder walletName;

  ImportKeypairFromStorageCommandBuilder({
    required String variable,
    required this.walletName,
  }) : _variable = variable;

  @override
  ImportKeypairFromStorageCommand build() {
    return ImportKeypairFromStorageCommand(
      variable: variable,
      walletName: walletName.build(),
    );
  }

  @override
  ImportKeypairFromStorageCommandBuilder clone() {
    return ImportKeypairFromStorageCommandBuilder(
      variable: variable,
      walletName: walletName.clone(),
    );
  }
}

ImportKeypairFromStorageCommand _$ImportKeypairFromStorageCommandFromJson(
    Map<String, dynamic> json) {
  return ImportKeypairFromStorageCommand(
    variable: json['variable'],
    walletName: Expression.fromJson(json['walletName']),
  );
}

Map<String, dynamic> _$ImportKeypairFromStorageCommandToJson(
    ImportKeypairFromStorageCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
    'walletName': value.walletName.toJson(),
  };
}

ImportKeypairFromStorageCommandBuilder _$ImportKeypairFromStorageCommandToBuilder(
    ImportKeypairFromStorageCommand value) {
  return ImportKeypairFromStorageCommandBuilder(
      variable: value.variable, walletName: value.walletName.asBuilder());
}
