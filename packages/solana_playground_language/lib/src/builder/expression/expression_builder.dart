/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class ExpressionBuilder extends Builder {
  ValueBuilder _valueBuilder;

  ExpressionBuilder({
    required ValueBuilder valueBuilder,
  }) : _valueBuilder = valueBuilder;

  factory ExpressionBuilder.withConstantValue({String value = ""}) {
    return ExpressionBuilder(valueBuilder: ConstantValueBuilder(value: value));
  }

  factory ExpressionBuilder.withVariable() {
    return ExpressionBuilder(valueBuilder: VariableValueBuilder(variable: ""));
  }

  factory ExpressionBuilder.withBinaryValue() {
    return ExpressionBuilder(
      valueBuilder: BinaryValueBuilder(data: []),
    );
  }

  ValueBuilder get valueBuilder => _valueBuilder;

  set valueBuilder(ValueBuilder valueBuilder) {
    _valueBuilder = valueBuilder;
    notifyListeners();
  }

  Expression build() {
    return Expression(value: valueBuilder.build());
  }

  @override
  ExpressionBuilder clone() {
    return ExpressionBuilder(valueBuilder: valueBuilder.clone());
  }
}

abstract class ValueBuilder extends Builder {
  Value build();

  String get name => runtimeType.toString();

  @override
  ValueBuilder clone();
}
