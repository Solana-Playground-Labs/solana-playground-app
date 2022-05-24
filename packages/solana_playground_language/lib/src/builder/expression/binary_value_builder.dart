/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class BinaryValueBuilder extends ValueBuilder {
  final ListBuilder<ExpressionBuilder> _data;

  BinaryValueBuilder({required List<ExpressionBuilder> data})
      : _data = ListBuilder(data);

  String get name => "Binary";

  ListBuilder<ExpressionBuilder> get data => _data;

  void update(void Function(List<ExpressionBuilder>) callback) {
    callback(_data);
    notifyListeners();
  }

  @override
  BinaryValue build() {
    return BinaryValue(data: data.map((e) => e.build()).toList());
  }

  @override
  ValueBuilder clone() {
    return BinaryValueBuilder(data: List.of(data));
  }
}

class ByteValueBuilder extends ValueBuilder {
  ExpressionBuilder _expression;
  int _length;

  ByteValueBuilder({
    required ExpressionBuilder expression,
    required int length,
  })  : _expression = expression,
        _length = length;

  factory ByteValueBuilder.empty() {
    return ByteValueBuilder(
      expression: ExpressionBuilder.withConstantValue(),
      length: 1,
    );
  }

  String get name => "Byte";

  ExpressionBuilder get expression => _expression;

  set expression(ExpressionBuilder value) {
    _expression = value;
    notifyListeners();
  }

  int get length => _length;

  set length(int value) {
    _length = value;
    notifyListeners();
  }

  @override
  Value build() {
    return ByteValue(expression: _expression.build(), length: _length);
  }

  @override
  ValueBuilder clone() {
    return ByteValueBuilder(expression: expression.clone(), length: length);
  }
}

class HexValueBuilder extends ValueBuilder {
  ExpressionBuilder _expression;

  HexValueBuilder({
    required ExpressionBuilder expression,
  })  : _expression = expression;

  String get name => "Hex";

  ExpressionBuilder get expression => _expression;

  set expression(ExpressionBuilder value) {
    _expression = value;
    notifyListeners();
  }

  @override
  Value build() {
    return HexValue(expression: _expression.build());
  }

  @override
  ValueBuilder clone() {
    return HexValueBuilder(expression: expression.clone());
  }
}

class StringByteValueBuilder extends ValueBuilder {
  ExpressionBuilder _expression;
  int _base;

  StringByteValueBuilder({
    required ExpressionBuilder expression,
    required int base,
  })  : _expression = expression,
        _base = base;

  String get name => "String";

  ExpressionBuilder get expression => _expression;

  set expression(ExpressionBuilder value) {
    _expression = value;
    notifyListeners();
  }

  int get base => _base;

  set base(int value) {
    _base = value;
    notifyListeners();
  }

  @override
  Value build() {
    return StringByteValue(expression: expression.build(), base: base);
  }

  @override
  ValueBuilder clone() {
    return StringByteValueBuilder(expression: expression.clone(), base: base);
  }
}
