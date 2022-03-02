import 'package:solana_playground_language/src/builder/builder.dart';
import 'package:solana_playground_language/src/core/expression/constant_value.dart';
import 'package:solana_playground_language/src/core/expression/expression.dart';

class ConstantValueBuilder extends ValueBuilder {
  final dynamic value;

  ConstantValueBuilder({required this.value});

  @override
  ConstantValue build() {
    return ConstantValue(value: value);
  }

  @override
  ConstantValueBuilder clone() {
    return ConstantValueBuilder(value: value);
  }
}
