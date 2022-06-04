// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computable_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class ComputableValueBuilder extends ValueBuilder {
  String _value;

  String get value => _value;

  set value(String value) {
    _value = value;
    notifyListeners();
  }

  @override
  String get name => "Computable";

  ComputableValueBuilder({
    required String value,
  }) : _value = value;

  @override
  ComputableValue build() {
    return ComputableValue(
      value: value,
    );
  }

  @override
  ComputableValueBuilder clone() {
    return ComputableValueBuilder(
      value: value,
    );
  }
}

ComputableValue _$ComputableValueFromJson(Map<String, dynamic> json) {
  return ComputableValue(
    value: json['value'],
  );
}

Map<String, dynamic> _$ComputableValueToJson(ComputableValue value) {
  return {
    'type': value.runtimeType.toString(),
    'value': value.value,
  };
}

ComputableValueBuilder _$ComputableValueToBuilder(ComputableValue value) {
  return ComputableValueBuilder(value: value.value);
}
