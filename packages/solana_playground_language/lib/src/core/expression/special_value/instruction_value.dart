/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'instruction_value.builder.dart';

@ValueBuildable()
class InstructionValue extends Value {
  @ValuePropertyBuildable()
  final Expression programId;

  @ValuePropertyBuildable()
  final Expression keys;

  @ValuePropertyBuildable()
  final Expression data;

  const InstructionValue({
    required this.programId,
    required this.keys,
    required this.data,
  });

  @override
  List<Object> get props => [programId, keys, data];

  @override
  ValueBuilder asBuilder() {
    return _$InstructionValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$InstructionValueToJson(this);
  }

  factory InstructionValue.fromJson(Map<String, dynamic> json) {
    return _$InstructionValueFromJson(json);
  }
}
