/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'string_value.builder.dart';

@ValueBuildable(displayName: "String")
class StringValue extends Value {
  @ValuePropertyBuildable()
  final String value;

  const StringValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];

  factory StringValue.fromJson(Map<String, dynamic> json) => _$StringValueFromJson(json);

  @override
  ValueBuilder asBuilder() => _$StringValueToBuilder(this);

  @override
  Map<String, dynamic> toJson() => _$StringValueToJson(this);
}
