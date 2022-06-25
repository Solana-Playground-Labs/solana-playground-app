/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'computable_value.builder.dart';

@ValueBuildable(displayName: "Computable")
class ComputableValue extends Value {
  @ValuePropertyBuildable()
  final String value;

  const ComputableValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];

  factory ComputableValue.fromJson(Map<String, dynamic> json) => _$ComputableValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ComputableValueToJson(this);

  @override
  ValueBuilder asBuilder() => _$ComputableValueToBuilder(this);
}
