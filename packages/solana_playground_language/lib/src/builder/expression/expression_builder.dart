/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/builder/expression/conditional_value_builder.dart';
import 'package:solana_playground_language/src/core/expression/conditional_value.dart';

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

  factory ExpressionBuilder.withJson({dynamic data = const {}}) {
    return ExpressionBuilder(valueBuilder: JsonValueBuilder(data: data));
  }

  factory ExpressionBuilder.withConditional() {
    return ExpressionBuilder(valueBuilder: ConditionalValueBuilder.empty());
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
