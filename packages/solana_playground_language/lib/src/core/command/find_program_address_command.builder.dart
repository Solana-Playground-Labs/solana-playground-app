// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_program_address_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class FindProgramAddressCommandBuilder extends CommandBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  final ExpressionBuilder programID;
  final ExpressionBuilder data;

  FindProgramAddressCommandBuilder({
    required String variable,
    required this.programID,
    required this.data,
  }) : _variable = variable;

  @override
  FindProgramAddressCommand build() {
    return FindProgramAddressCommand(
      variable: variable,
      programID: programID.build(),
      data: data.build(),
    );
  }

  @override
  FindProgramAddressCommandBuilder clone() {
    return FindProgramAddressCommandBuilder(
      variable: variable,
      programID: programID.clone(),
      data: data.clone(),
    );
  }
}

FindProgramAddressCommand _$FindProgramAddressCommandFromJson(
    Map<String, dynamic> json) {
  return FindProgramAddressCommand(
    variable: json['variable'],
    programID: Expression.fromJson(json['programID']),
    data: Expression.fromJson(json['data']),
  );
}

Map<String, dynamic> _$FindProgramAddressCommandToJson(
    FindProgramAddressCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
    'programID': value.programID.toJson(),
    'data': value.data.toJson(),
  };
}

FindProgramAddressCommandBuilder _$FindProgramAddressCommandToBuilder(
    FindProgramAddressCommand value) {
  return FindProgramAddressCommandBuilder(
      variable: value.variable,
      programID: value.programID.asBuilder(),
      data: value.data.asBuilder());
}
