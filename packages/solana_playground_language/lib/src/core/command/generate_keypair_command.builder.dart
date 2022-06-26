// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_keypair_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class GenerateKeypairCommandBuilder extends CommandBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  GenerateKeypairCommandBuilder({
    required String variable,
  }) : _variable = variable;

  @override
  GenerateKeypairCommand build() {
    return GenerateKeypairCommand(
      variable: variable,
    );
  }

  @override
  GenerateKeypairCommandBuilder clone() {
    return GenerateKeypairCommandBuilder(
      variable: variable,
    );
  }
}

GenerateKeypairCommand _$GenerateKeypairCommandFromJson(
    Map<String, dynamic> json) {
  return GenerateKeypairCommand(
    variable: json['variable'],
  );
}

Map<String, dynamic> _$GenerateKeypairCommandToJson(
    GenerateKeypairCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
  };
}

GenerateKeypairCommandBuilder _$GenerateKeypairCommandToBuilder(
    GenerateKeypairCommand value) {
  return GenerateKeypairCommandBuilder(variable: value.variable);
}
