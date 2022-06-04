/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'int_value.builder.dart';

@ValueBuildable(displayName: "Int")
class IntValue extends Value {
  @ValuePropertyBuildable()
  final int value;

  const IntValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];

  factory IntValue.fromJson(Map<String, dynamic> json) =>
      _$IntValueFromJson(json);

  @override
  ValueBuilder asBuilder() => _$IntValueToBuilder(this);

  @override
  Map<String, dynamic> toJson() => _$IntValueToJson(this);
}
