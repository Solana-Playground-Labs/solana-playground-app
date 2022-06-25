import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';

Future<dynamic> calculateConditionValue(
  SPRuntime runtime,
  ConditionValue value,
) async {
  final leftValue = await runtime.calculate(value.left);
  final rightValue = await runtime.calculate(value.right);

  switch (value.comparisonOperator) {
    case ComparisonOperator.equal:
      return leftValue == rightValue;
    case ComparisonOperator.notEqual:
      return leftValue != rightValue;
    case ComparisonOperator.less:
      return leftValue < rightValue;
    case ComparisonOperator.lessOrEqual:
      return leftValue <= rightValue;
    case ComparisonOperator.greater:
      return leftValue > rightValue;
    case ComparisonOperator.greaterOrEqual:
      return leftValue >= rightValue;
  }
}
