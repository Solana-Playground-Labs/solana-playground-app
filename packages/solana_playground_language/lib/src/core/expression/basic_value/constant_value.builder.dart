// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constant_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class ConstantValueBuilder extends ValueBuilder {
  String _value;

  String get value => _value;

  set value(String value) {
    _value = value;
    notifyListeners();
  }

  @override
  String get name => "Const";

  ConstantValueBuilder({
    required String value,
  }) : _value = value;

  @override
  ConstantValue build() {
    return ConstantValue(
      value: value,
    );
  }

  @override
  ConstantValueBuilder clone() {
    return ConstantValueBuilder(
      value: value,
    );
  }
}

ConstantValue _$ConstantValueFromJson(Map<String, dynamic> json) {
  return ConstantValue(
    value: json['value'],
  );
}

Map<String, dynamic> _$ConstantValueToJson(ConstantValue value) {
  return {
    'type': value.runtimeType.toString(),
    'value': value.value,
  };
}

ConstantValueBuilder _$ConstantValueToBuilder(ConstantValue value) {
  return ConstantValueBuilder(value: value.value);
}
