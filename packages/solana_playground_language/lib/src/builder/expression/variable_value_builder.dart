import 'package:solana_playground_language/src/builder/builder.dart';
import 'package:solana_playground_language/src/core/expression/variable_value.dart';

class VariableValueBuilder extends ValueBuilder {
  String variable;

  VariableValueBuilder({required this.variable});

  @override
  VariableValue build() {
    return VariableValue(variable: variable);
  }

  @override
  Builder clone() {
    return VariableValueBuilder(variable: variable);
  }
}
