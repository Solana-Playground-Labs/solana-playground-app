// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class InstructionValueBuilder extends ValueBuilder {
  final ExpressionBuilder programId;
  final ExpressionBuilder keys;
  final ExpressionBuilder data;
  final ExpressionBuilder condition;

  @override
  String get name => "InstructionValue";

  InstructionValueBuilder({
    required this.programId,
    required this.keys,
    required this.data,
    required this.condition,
  });

  @override
  InstructionValue build() {
    return InstructionValue(
      programId: programId.build(),
      keys: keys.build(),
      data: data.build(),
      condition: condition.build(),
    );
  }

  @override
  InstructionValueBuilder clone() {
    return InstructionValueBuilder(
      programId: programId.clone(),
      keys: keys.clone(),
      data: data.clone(),
      condition: condition.clone(),
    );
  }
}

InstructionValue _$InstructionValueFromJson(Map<String, dynamic> json) {
  return InstructionValue(
    programId: Expression.fromJson(json['programId']),
    keys: Expression.fromJson(json['keys']),
    data: Expression.fromJson(json['data']),
    condition: Expression.fromJson(json['condition']),
  );
}

Map<String, dynamic> _$InstructionValueToJson(InstructionValue value) {
  return {
    'type': value.runtimeType.toString(),
    'programId': value.programId.toJson(),
    'keys': value.keys.toJson(),
    'data': value.data.toJson(),
    'condition': value.condition.toJson(),
  };
}

InstructionValueBuilder _$InstructionValueToBuilder(InstructionValue value) {
  return InstructionValueBuilder(
      programId: value.programId.asBuilder(),
      keys: value.keys.asBuilder(),
      data: value.data.asBuilder(),
      condition: value.condition.asBuilder());
}
