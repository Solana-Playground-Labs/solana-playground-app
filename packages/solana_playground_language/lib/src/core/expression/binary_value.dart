import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class BinaryValue extends Value {
  final List<Expression> data;

  const BinaryValue({required this.data});

  @override
  List<Object> get props => [data];

  factory BinaryValue.fromJson(Map<String, dynamic> json) {
    return BinaryValue(
      data: List.castFrom(json['data'].map((e) => Expression.fromJson(e)).toList()),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class ByteValue extends Value {
  final Expression expression;
  final int length;

  const ByteValue({
    required this.expression,
    required this.length,
  });

  @override
  List<Object> get props => [expression, length];

  factory ByteValue.fromJson(Map<String, dynamic> json) {
    return ByteValue(
      expression: Expression.fromJson(json['expression']),
      length: json['length'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'expression': expression.toJson(),
      'length': length,
    };
  }
}

class HexValue extends Value {
  final Expression expression;

  const HexValue({
    required this.expression,
  });

  @override
  List<Object> get props => [expression];

  factory HexValue.fromJson(Map<String, dynamic> json) {
    return HexValue(
      expression: Expression.fromJson(json['expression']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'expression': expression.toJson(),
    };
  }
}

class StringByteValue extends Value {
  final Expression expression;
  final int base;

  const StringByteValue({
    required this.expression,
    required this.base,
  });

  @override
  List<Object> get props => [expression, base];

  factory StringByteValue.fromJson(Map<String, dynamic> json) {
    return StringByteValue(
      expression: Expression.fromJson(json['expression']),
      base: json['length'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'expression': expression.toJson(),
      'base': base,
    };
  }
}
