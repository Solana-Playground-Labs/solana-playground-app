// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expression_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class ExpressionValueBuilder extends ValueBuilder {
  String _value;

  String get value => _value;

  set value(String value) {
    _value = value;
    notifyListeners();
  }

  @override
  String get name => "Expression";

  ExpressionValueBuilder({
    required String value,
  }) : _value = value;

  @override
  ExpressionValue build() {
    return ExpressionValue(
      value: value,
    );
  }

  @override
  ExpressionValueBuilder clone() {
    return ExpressionValueBuilder(
      value: value,
    );
  }
}

ExpressionValue _$ExpressionValueFromJson(Map<String, dynamic> json) {
  return ExpressionValue(
    value: json['value'],
  );
}

Map<String, dynamic> _$ExpressionValueToJson(ExpressionValue value) {
  return {
    'type': value.runtimeType.toString(),
    'value': value.value,
  };
}

ExpressionValueBuilder _$ExpressionValueToBuilder(ExpressionValue value) {
  return ExpressionValueBuilder(value: value.value);
}
