// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hex_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class HexValueBuilder extends ValueBuilder {
  final ExpressionBuilder expression;

  @override
  String get name => "HexValue";

  HexValueBuilder({
    required this.expression,
  });

  @override
  HexValue build() {
    return HexValue(
      expression: expression.build(),
    );
  }

  @override
  HexValueBuilder clone() {
    return HexValueBuilder(
      expression: expression.clone(),
    );
  }
}

HexValue _$HexValueFromJson(Map<String, dynamic> json) {
  return HexValue(
    expression: Expression.fromJson(json['expression']),
  );
}

Map<String, dynamic> _$HexValueToJson(HexValue value) {
  return {
    'type': value.runtimeType.toString(),
    'expression': value.expression.toJson(),
  };
}

HexValueBuilder _$HexValueToBuilder(HexValue value) {
  return HexValueBuilder(expression: value.expression.asBuilder());
}
