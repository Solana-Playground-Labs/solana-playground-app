// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class ConditionValueBuilder extends ValueBuilder {
  final ExpressionBuilder left;
  final ExpressionBuilder right;
  ComparisonOperator _comparisonOperator;

  ComparisonOperator get comparisonOperator => _comparisonOperator;

  set comparisonOperator(ComparisonOperator value) {
    _comparisonOperator = value;
    notifyListeners();
  }

  @override
  String get name => "Condition";

  ConditionValueBuilder({
    required this.left,
    required this.right,
    required ComparisonOperator comparisonOperator,
  }) : _comparisonOperator = comparisonOperator;

  @override
  ConditionValue build() {
    return ConditionValue(
      left: left.build(),
      right: right.build(),
      comparisonOperator: comparisonOperator,
    );
  }

  @override
  ConditionValueBuilder clone() {
    return ConditionValueBuilder(
      left: left.clone(),
      right: right.clone(),
      comparisonOperator: comparisonOperator,
    );
  }
}

ConditionValue _$ConditionValueFromJson(Map<String, dynamic> json) {
  return ConditionValue(
    left: Expression.fromJson(json['left']),
    right: Expression.fromJson(json['right']),
    comparisonOperator: json['comparisonOperator'],
  );
}

Map<String, dynamic> _$ConditionValueToJson(ConditionValue value) {
  return {
    'type': value.runtimeType.toString(),
    'left': value.left.toJson(),
    'right': value.right.toJson(),
    'comparisonOperator': value.comparisonOperator,
  };
}

ConditionValueBuilder _$ConditionValueToBuilder(ConditionValue value) {
  return ConditionValueBuilder(
      left: value.left.asBuilder(),
      right: value.right.asBuilder(),
      comparisonOperator: value.comparisonOperator);
}
