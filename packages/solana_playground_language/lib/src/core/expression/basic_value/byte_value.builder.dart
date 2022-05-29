// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'byte_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class ByteValueBuilder extends ValueBuilder {
  final ExpressionBuilder expression;
  int _length;

  int get length => _length;

  set length(int value) {
    _length = value;
    notifyListeners();
  }

  @override
  String get name => "ByteValue";

  ByteValueBuilder({
    required this.expression,
    required int length,
  }) : _length = length;

  @override
  ByteValue build() {
    return ByteValue(
      expression: expression.build(),
      length: length,
    );
  }

  @override
  ByteValueBuilder clone() {
    return ByteValueBuilder(
      expression: expression.clone(),
      length: length,
    );
  }
}

ByteValue _$ByteValueFromJson(Map<String, dynamic> json) {
  return ByteValue(
    expression: Expression.fromJson(json['expression']),
    length: json['length'],
  );
}

Map<String, dynamic> _$ByteValueToJson(ByteValue value) {
  return {
    'type': value.runtimeType.toString(),
    'expression': value.expression.toJson(),
    'length': value.length,
  };
}

ByteValueBuilder _$ByteValueToBuilder(ByteValue value) {
  return ByteValueBuilder(
      expression: value.expression.asBuilder(), length: value.length);
}
