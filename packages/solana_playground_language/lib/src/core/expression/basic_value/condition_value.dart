/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'condition_value.builder.dart';

enum ComparisonOperator {
  equal,
  notEqual,
  less,
  lessOrEqual,
  greater,
  greaterOrEqual,
}

@ValueBuildable()
class ConditionValue extends Value {
  @ValuePropertyBuildable()
  final Expression left;

  @ValuePropertyBuildable()
  final Expression right;

  @ValuePropertyBuildable()
  final ComparisonOperator comparisonOperator;

  const ConditionValue({
    required this.left,
    required this.right,
    required this.comparisonOperator,
  });

  @override
  List<Object?> get props => [left, right, comparisonOperator];

  factory ConditionValue.fromJson(Map<String, dynamic> json) => _$ConditionValueFromJson(json);

  @override
  ValueBuilder asBuilder() => _$ConditionValueToBuilder(this);

  @override
  Map<String, dynamic> toJson() => _$ConditionValueToJson(this);
}
