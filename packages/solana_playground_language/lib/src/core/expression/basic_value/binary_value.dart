/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

part 'binary_value.builder.dart';

@ValueBuildable()
class BinaryValue extends Value {
  @ValuePropertyBuildable()
  final Expression data;

  const BinaryValue({required this.data});

  @override
  List<Object> get props => [data];

  factory BinaryValue.fromJson(Map<String, dynamic> json) =>
      _$BinaryValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BinaryValueToJson(this);

  @override
  ValueBuilder asBuilder() => _$BinaryValueToBuilder(this);
}
