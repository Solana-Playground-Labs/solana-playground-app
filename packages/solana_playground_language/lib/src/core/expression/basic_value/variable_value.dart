/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'variable_value.builder.dart';

@ValueBuildable()
class VariableValue extends Value {
  @ValuePropertyBuildable()
  final String variable;

  const VariableValue({required this.variable});

  @override
  List<Object> get props => [variable];

  factory VariableValue.fromJson(Map<String, dynamic> json) =>
      _$VariableValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VariableValueToJson(this);

  @override
  ValueBuilder asBuilder() => _$VariableValueToBuilder(this);
}
