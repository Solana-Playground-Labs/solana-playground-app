/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

part 'conditional_wrapper_value.builder.dart';

@ValueBuildable()
class ConditionalWrapperValue extends Value {
  @ValuePropertyBuildable()
  final Expression condition;

  @ValuePropertyBuildable()
  final Expression trueFlow;

  @ValuePropertyBuildable()
  final Expression falseFlow;

  const ConditionalWrapperValue({
    required this.condition,
    required this.trueFlow,
    required this.falseFlow,
  });

  factory ConditionalWrapperValue.fromJson(Map<String, dynamic> json) =>
      _$ConditionalWrapperValueFromJson(json);

  @override
  ValueBuilder asBuilder() => _$ConditionalWrapperValueToBuilder(this);

  @override
  List<Object> get props => [condition, trueFlow, falseFlow];

  @override
  Map<String, dynamic> toJson() => _$ConditionalWrapperValueToJson(this);
}
