/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'conditional_value.builder.dart';

enum ComparisonOperator {
  equal,
  notEqual,
  less,
  lessOrEqual,
  greater,
  greaterOrEqual,
}

@ValueBuildable()
class ConditionalValue extends Value {
  @ValuePropertyBuildable()
  final Expression left;

  @ValuePropertyBuildable()
  final Expression right;

  @ValuePropertyBuildable()
  final ComparisonOperator comparisonOperator;

  const ConditionalValue({
    required this.left,
    required this.right,
    required this.comparisonOperator,
  });

  @override
  List<Object?> get props => [left, right, comparisonOperator];

  factory ConditionalValue.fromJson(Map<String, dynamic> json) =>
      _$ConditionalValueFromJson(json);

  @override
  ValueBuilder asBuilder() => _$ConditionalValueToBuilder(this);

  @override
  Map<String, dynamic> toJson() => _$ConditionalValueToJson(this);
}
