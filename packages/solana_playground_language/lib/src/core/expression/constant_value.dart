/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/expression/expression_builder.dart';
import 'package:solana_playground_language/src/core/expression/value.dart';

class ConstantValue extends Value {
  final String value;

  const ConstantValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];

  factory ConstantValue.fromJson(Map<String, dynamic> json) {
    return ConstantValue(value: json['value']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'value': value,
    };
  }

  @override
  ValueBuilder asBuilder() {
    return ConstantValueBuilder(value: value);
  }
}
