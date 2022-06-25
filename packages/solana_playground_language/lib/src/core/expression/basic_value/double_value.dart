/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'double_value.builder.dart';

@ValueBuildable(displayName: "Double")
class DoubleValue extends Value {
  @ValuePropertyBuildable()
  final double value;

  const DoubleValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];

  factory DoubleValue.fromJson(Map<String, dynamic> json) => _$DoubleValueFromJson(json);

  @override
  ValueBuilder asBuilder() => _$DoubleValueToBuilder(this);

  @override
  Map<String, dynamic> toJson() => _$DoubleValueToJson(this);
}
