/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

enum ComparisonOperator {
  equal,
  notEqual,
  less,
  lessOrEqual,
  greater,
  greaterOrEqual,
}

class ConditionalValue extends Value {
  final Expression left;
  final Expression right;
  final ComparisonOperator comparisonOperator;

  const ConditionalValue({
    required this.left,
    required this.right,
    required this.comparisonOperator,
  });

  factory ConditionalValue.fromJson(Map<String, dynamic> json) {
    return ConditionalValue(
      left: Expression.fromJson(json['left']),
      right: Expression.fromJson(json['right']),
      comparisonOperator: ComparisonOperator.values[json['comparisonOperator']],
    );
  }



  @override
  ValueBuilder asBuilder() {
    return ConditionalValueBuilder(
      left: left.asBuilder(),
      right: right.asBuilder(),
      comparisonOperator: comparisonOperator,
    );
  }

  @override
  List<Object?> get props => [left, right, comparisonOperator];

  @override
  Map<String, dynamic> toJson() {
    return {
      "left": left.toJson(),
      "right": right.toJson(),
      "comparisonOperator": comparisonOperator.index,
    };
  }
}
