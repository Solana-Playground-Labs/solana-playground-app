// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'double_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class DoubleValueBuilder extends ValueBuilder {
  double _value;

  double get value => _value;

  set value(double value) {
    _value = value;
    notifyListeners();
  }

  @override
  String get name => "Double";

  DoubleValueBuilder({
    required double value,
  }) : _value = value;

  @override
  DoubleValue build() {
    return DoubleValue(
      value: value,
    );
  }

  @override
  DoubleValueBuilder clone() {
    return DoubleValueBuilder(
      value: value,
    );
  }
}

DoubleValue _$DoubleValueFromJson(Map<String, dynamic> json) {
  return DoubleValue(
    value: json['value'],
  );
}

Map<String, dynamic> _$DoubleValueToJson(DoubleValue value) {
  return {
    'type': value.runtimeType.toString(),
    'value': value.value,
  };
}

DoubleValueBuilder _$DoubleValueToBuilder(DoubleValue value) {
  return DoubleValueBuilder(value: value.value);
}
