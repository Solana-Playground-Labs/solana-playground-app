// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'int_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class IntValueBuilder extends ValueBuilder {
  int _value;

  int get value => _value;

  set value(int value) {
    _value = value;
    notifyListeners();
  }

  @override
  String get name => "Int";

  IntValueBuilder({
    required int value,
  }) : _value = value;

  @override
  IntValue build() {
    return IntValue(
      value: value,
    );
  }

  @override
  IntValueBuilder clone() {
    return IntValueBuilder(
      value: value,
    );
  }
}

IntValue _$IntValueFromJson(Map<String, dynamic> json) {
  return IntValue(
    value: json['value'],
  );
}

Map<String, dynamic> _$IntValueToJson(IntValue value) {
  return {
    'type': value.runtimeType.toString(),
    'value': value.value,
  };
}

IntValueBuilder _$IntValueToBuilder(IntValue value) {
  return IntValueBuilder(value: value.value);
}
