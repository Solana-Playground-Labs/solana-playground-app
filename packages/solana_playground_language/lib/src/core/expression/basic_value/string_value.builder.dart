// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class StringValueBuilder extends ValueBuilder {
  String _value;

  String get value => _value;

  set value(String value) {
    _value = value;
    notifyListeners();
  }

  @override
  String get name => "String";

  StringValueBuilder({
    required String value,
  }) : _value = value;

  @override
  StringValue build() {
    return StringValue(
      value: value,
    );
  }

  @override
  StringValueBuilder clone() {
    return StringValueBuilder(
      value: value,
    );
  }
}

StringValue _$StringValueFromJson(Map<String, dynamic> json) {
  return StringValue(
    value: json['value'],
  );
}

Map<String, dynamic> _$StringValueToJson(StringValue value) {
  return {
    'type': value.runtimeType.toString(),
    'value': value.value,
  };
}

StringValueBuilder _$StringValueToBuilder(StringValue value) {
  return StringValueBuilder(value: value.value);
}
