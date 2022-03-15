/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/expression/expression_builder.dart';

import 'value.dart';

class VariableValue extends Value {
  final String variable;

  const VariableValue({required this.variable});

  @override
  List<Object> get props => [variable];

  factory VariableValue.fromJson(Map<String, dynamic> json) {
    return VariableValue(variable: json['variable']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'variable': variable,
    };
  }

  @override
  ValueBuilder asBuilder() {
    return VariableValueBuilder(variable: variable);
  }
}
