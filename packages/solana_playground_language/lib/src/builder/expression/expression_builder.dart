import 'package:solana_playground_language/solana_playground_language.dart';

class ExpressionBuilder extends Builder {
  ValueBuilder valueBuilder;

  ExpressionBuilder({required this.valueBuilder});

  factory ExpressionBuilder.withConstantValue() {
    return ExpressionBuilder(valueBuilder: ConstantValueBuilder(value: ""));
  }

  Expression build() {
    return Expression(value: valueBuilder.build());
  }

  @override
  ExpressionBuilder clone() {
    return ExpressionBuilder(valueBuilder: valueBuilder);
  }
}

abstract class ValueBuilder extends Builder {
  Value build();
}
