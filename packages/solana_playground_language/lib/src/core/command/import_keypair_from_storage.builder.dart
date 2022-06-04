// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_keypair_from_storage.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class ImportKeypairFromStorageCommandBuilder extends CommandBuilder {
  final ExpressionBuilder walletName;
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  ImportKeypairFromStorageCommandBuilder({
    required this.walletName,
    required String variable,
  }) : _variable = variable;

  @override
  ImportKeypairFromStorageCommand build() {
    return ImportKeypairFromStorageCommand(
      walletName: walletName.build(),
      variable: variable,
    );
  }

  @override
  ImportKeypairFromStorageCommandBuilder clone() {
    return ImportKeypairFromStorageCommandBuilder(
      walletName: walletName.clone(),
      variable: variable,
    );
  }
}

ImportKeypairFromStorageCommand _$ImportKeypairFromStorageCommandFromJson(
    Map<String, dynamic> json) {
  return ImportKeypairFromStorageCommand(
    walletName: Expression.fromJson(json['walletName']),
    variable: json['variable'],
  );
}

Map<String, dynamic> _$ImportKeypairFromStorageCommandToJson(
    ImportKeypairFromStorageCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'walletName': value.walletName.toJson(),
    'variable': value.variable,
  };
}

ImportKeypairFromStorageCommandBuilder
    _$ImportKeypairFromStorageCommandToBuilder(
        ImportKeypairFromStorageCommand value) {
  return ImportKeypairFromStorageCommandBuilder(
      walletName: value.walletName.asBuilder(), variable: value.variable);
}
