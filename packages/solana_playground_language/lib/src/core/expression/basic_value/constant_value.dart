/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'constant_value.builder.dart';

@ValueBuildable(displayName: "Const")
class ConstantValue extends Value {
  @ValuePropertyBuildable()
  final String value;

  const ConstantValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];

  factory ConstantValue.fromJson(Map<String, dynamic> json) =>
      _$ConstantValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConstantValueToJson(this);

  @override
  ValueBuilder asBuilder() => _$ConstantValueToBuilder(this);
}
