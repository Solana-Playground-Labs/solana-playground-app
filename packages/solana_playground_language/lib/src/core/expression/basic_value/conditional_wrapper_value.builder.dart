// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditional_wrapper_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class ConditionalWrapperValueBuilder extends ValueBuilder {
  final ExpressionBuilder condition;
  final ExpressionBuilder trueFlow;
  final ExpressionBuilder falseFlow;

  @override
  String get name => "ConditionalWrapper";

  ConditionalWrapperValueBuilder({
    required this.condition,
    required this.trueFlow,
    required this.falseFlow,
  });

  @override
  ConditionalWrapperValue build() {
    return ConditionalWrapperValue(
      condition: condition.build(),
      trueFlow: trueFlow.build(),
      falseFlow: falseFlow.build(),
    );
  }

  @override
  ConditionalWrapperValueBuilder clone() {
    return ConditionalWrapperValueBuilder(
      condition: condition.clone(),
      trueFlow: trueFlow.clone(),
      falseFlow: falseFlow.clone(),
    );
  }
}

ConditionalWrapperValue _$ConditionalWrapperValueFromJson(Map<String, dynamic> json) {
  return ConditionalWrapperValue(
    condition: Expression.fromJson(json['condition']),
    trueFlow: Expression.fromJson(json['trueFlow']),
    falseFlow: Expression.fromJson(json['falseFlow']),
  );
}

Map<String, dynamic> _$ConditionalWrapperValueToJson(ConditionalWrapperValue value) {
  return {
    'type': value.runtimeType.toString(),
    'condition': value.condition.toJson(),
    'trueFlow': value.trueFlow.toJson(),
    'falseFlow': value.falseFlow.toJson(),
  };
}

ConditionalWrapperValueBuilder _$ConditionalWrapperValueToBuilder(ConditionalWrapperValue value) {
  return ConditionalWrapperValueBuilder(
      condition: value.condition.asBuilder(),
      trueFlow: value.trueFlow.asBuilder(),
      falseFlow: value.falseFlow.asBuilder());
}
