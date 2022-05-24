/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class ConditionalValueBuilder extends ValueBuilder {
  final ExpressionBuilder left;
  final ExpressionBuilder right;

  ComparisonOperator _comparisonOperator;

  ConditionalValueBuilder({
    required this.left,
    required this.right,
    required ComparisonOperator comparisonOperator,
  }) : _comparisonOperator = comparisonOperator;

  factory ConditionalValueBuilder.empty() {
    return ConditionalValueBuilder(
      left: ExpressionBuilder.withVariable(),
      right: ExpressionBuilder.withConstantValue(),
      comparisonOperator: ComparisonOperator.equal,
    );
  }

  ComparisonOperator get comparisonOperator => _comparisonOperator;

  set comparisonOperator(ComparisonOperator comparisonOperator) {
    _comparisonOperator = comparisonOperator;
    notifyListeners();
  }

  @override
  String get name => "Condition";

  @override
  ConditionalValue build() {
    return ConditionalValue(
      left: left.build(),
      right: right.build(),
      comparisonOperator: comparisonOperator,
    );
  }

  @override
  ValueBuilder clone() {
    return ConditionalValueBuilder(
      left: left.clone(),
      right: right.clone(),
      comparisonOperator: comparisonOperator,
    );
  }
}
