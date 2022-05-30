// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_byte_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class StringByteValueBuilder extends ValueBuilder {
  final ExpressionBuilder expression;
  int _base;

  int get base => _base;

  set base(int value) {
    _base = value;
    notifyListeners();
  }

  @override
  String get name => "StringByte";

  StringByteValueBuilder({
    required this.expression,
    required int base,
  }) : _base = base;

  @override
  StringByteValue build() {
    return StringByteValue(
      expression: expression.build(),
      base: base,
    );
  }

  @override
  StringByteValueBuilder clone() {
    return StringByteValueBuilder(
      expression: expression.clone(),
      base: base,
    );
  }
}

StringByteValue _$StringByteValueFromJson(Map<String, dynamic> json) {
  return StringByteValue(
    expression: Expression.fromJson(json['expression']),
    base: json['base'],
  );
}

Map<String, dynamic> _$StringByteValueToJson(StringByteValue value) {
  return {
    'type': value.runtimeType.toString(),
    'expression': value.expression.toJson(),
    'base': value.base,
  };
}

StringByteValueBuilder _$StringByteValueToBuilder(StringByteValue value) {
  return StringByteValueBuilder(
      expression: value.expression.asBuilder(), base: value.base);
}
