import 'package:solana_playground_language/src/core/expression/expression.dart';
import 'package:solana_playground_language/src/core/expression/value.dart';

import '../core_builder.dart';

class ExpressionBuilder extends Builder {
  ValueBuilder valueBuilder;

  ExpressionBuilder({required this.valueBuilder});

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
