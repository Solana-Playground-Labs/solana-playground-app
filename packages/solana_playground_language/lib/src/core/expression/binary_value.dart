import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class BinaryValue extends Value {
  final List<Expression> data;

  const BinaryValue({required this.data});

  @override
  List<Object> get props => [data];
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
}

class HexValue extends Value {
  final Expression expression;

  const HexValue({
    required this.expression,
  });

  @override
  List<Object> get props => [expression];
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
}
