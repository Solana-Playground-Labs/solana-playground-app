// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_utf8_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class StringUtf8ValueBuilder extends ValueBuilder {
  final ExpressionBuilder expression;

  @override
  String get name => "Utf8";

  StringUtf8ValueBuilder({
    required this.expression,
  });

  @override
  StringUtf8Value build() {
    return StringUtf8Value(
      expression: expression.build(),
    );
  }

  @override
  StringUtf8ValueBuilder clone() {
    return StringUtf8ValueBuilder(
      expression: expression.clone(),
    );
  }
}

StringUtf8Value _$StringUtf8ValueFromJson(Map<String, dynamic> json) {
  return StringUtf8Value(
    expression: Expression.fromJson(json['expression']),
  );
}

Map<String, dynamic> _$StringUtf8ValueToJson(StringUtf8Value value) {
  return {
    'type': value.runtimeType.toString(),
    'expression': value.expression.toJson(),
  };
}

StringUtf8ValueBuilder _$StringUtf8ValueToBuilder(StringUtf8Value value) {
  return StringUtf8ValueBuilder(expression: value.expression.asBuilder());
}
