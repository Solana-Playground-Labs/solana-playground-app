// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class VariableValueBuilder extends ValueBuilder {
  String _variable;

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  @override
  String get name => "VariableValue";

  VariableValueBuilder({
    required String variable,
  }) : _variable = variable;

  @override
  VariableValue build() {
    return VariableValue(
      variable: variable,
    );
  }

  @override
  VariableValueBuilder clone() {
    return VariableValueBuilder(
      variable: variable,
    );
  }
}

VariableValue _$VariableValueFromJson(Map<String, dynamic> json) {
  return VariableValue(
    variable: json['variable'],
  );
}

Map<String, dynamic> _$VariableValueToJson(VariableValue value) {
  return {
    'type': value.runtimeType.toString(),
    'variable': value.variable,
  };
}

VariableValueBuilder _$VariableValueToBuilder(VariableValue value) {
  return VariableValueBuilder(variable: value.variable);
}
