// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditional_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class ConditionalValueBuilder extends ValueBuilder {
  final ExpressionBuilder left;
  final ExpressionBuilder right;
  ComparisonOperator _comparisonOperator;

  ComparisonOperator get comparisonOperator => _comparisonOperator;

  set comparisonOperator(ComparisonOperator value) {
    _comparisonOperator = value;
    notifyListeners();
  }

  @override
  String get name => "ConditionalValue";

  ConditionalValueBuilder({
    required this.left,
    required this.right,
    required ComparisonOperator comparisonOperator,
  }) : _comparisonOperator = comparisonOperator;

  @override
  ConditionalValue build() {
    return ConditionalValue(
      left: left.build(),
      right: right.build(),
      comparisonOperator: comparisonOperator,
    );
  }

  @override
  ConditionalValueBuilder clone() {
    return ConditionalValueBuilder(
      left: left.clone(),
      right: right.clone(),
      comparisonOperator: comparisonOperator,
    );
  }
}

ConditionalValue _$ConditionalValueFromJson(Map<String, dynamic> json) {
  return ConditionalValue(
    left: Expression.fromJson(json['left']),
    right: Expression.fromJson(json['right']),
    comparisonOperator: json['comparisonOperator'],
  );
}

Map<String, dynamic> _$ConditionalValueToJson(ConditionalValue value) {
  return {
    'type': value.runtimeType.toString(),
    'left': value.left.toJson(),
    'right': value.right.toJson(),
    'comparisonOperator': value.comparisonOperator,
  };
}

ConditionalValueBuilder _$ConditionalValueToBuilder(ConditionalValue value) {
  return ConditionalValueBuilder(
      left: value.left.asBuilder(),
      right: value.right.asBuilder(),
      comparisonOperator: value.comparisonOperator);
}
