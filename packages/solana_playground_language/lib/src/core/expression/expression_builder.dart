/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class ExpressionBuilder extends Builder {
  ValueBuilder _valueBuilder;

  ExpressionBuilder({
    required ValueBuilder valueBuilder,
  }) : _valueBuilder = valueBuilder;

  factory ExpressionBuilder.withConstantValue({String? value}) {
    return ExpressionBuilder(
      valueBuilder: ConstantValueBuilder(
        value: value ?? "",
      ),
    );
  }

  factory ExpressionBuilder.withVariable() {
    return ExpressionBuilder(valueBuilder: VariableValueBuilder(variable: ""));
  }

  factory ExpressionBuilder.withNull() {
    return ExpressionBuilder(valueBuilder: NullValueBuilder());
  }

  factory ExpressionBuilder.withBinaryValue() {
    return ExpressionBuilder(
      valueBuilder: BinaryValueBuilder(
        data: ExpressionBuilder.withList(),
      ),
    );
  }

  factory ExpressionBuilder.withList() {
    return ExpressionBuilder(valueBuilder: ListValueBuilder(expressions: []));
  }

  factory ExpressionBuilder.withBool() {
    return ExpressionBuilder(valueBuilder: BoolValueBuilder(value: false));
  }

  factory ExpressionBuilder.withCondition() {
    return ExpressionBuilder(
      valueBuilder: ConditionValueBuilder(
        left: ExpressionBuilder.withVariable(),
        right: ExpressionBuilder.withConstantValue(),
        comparisonOperator: ComparisonOperator.equal,
      ),
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
