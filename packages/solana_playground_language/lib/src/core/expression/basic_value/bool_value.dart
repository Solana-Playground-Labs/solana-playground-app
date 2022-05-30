/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'bool_value.builder.dart';

@ValueBuildable()
class BoolValue extends Value {
  @ValuePropertyBuildable()
  final bool value;

  const BoolValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];

  factory BoolValue.fromJson(Map<String, dynamic> json) =>
      _$BoolValueFromJson(json);

  @override
  ValueBuilder asBuilder() => _$BoolValueToBuilder(this);

  @override
  Map<String, dynamic> toJson() => _$BoolValueToJson(this);
}
