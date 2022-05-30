// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bool_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class BoolValueBuilder extends ValueBuilder {
  bool _value;

  bool get value => _value;

  set value(bool value) {
    _value = value;
    notifyListeners();
  }

  @override
  String get name => "Bool";

  BoolValueBuilder({
    required bool value,
  }) : _value = value;

  @override
  BoolValue build() {
    return BoolValue(
      value: value,
    );
  }

  @override
  BoolValueBuilder clone() {
    return BoolValueBuilder(
      value: value,
    );
  }
}

BoolValue _$BoolValueFromJson(Map<String, dynamic> json) {
  return BoolValue(
    value: json['value'],
  );
}

Map<String, dynamic> _$BoolValueToJson(BoolValue value) {
  return {
    'type': value.runtimeType.toString(),
    'value': value.value,
  };
}

BoolValueBuilder _$BoolValueToBuilder(BoolValue value) {
  return BoolValueBuilder(value: value.value);
}
