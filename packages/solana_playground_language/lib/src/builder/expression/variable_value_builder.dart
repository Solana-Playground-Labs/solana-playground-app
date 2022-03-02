import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/expression/variable_value.dart';

class VariableValueBuilder extends ValueBuilder {
  String _variable;

  VariableValueBuilder({required String variable}) : _variable = variable;

  String get variable => _variable;

  set variable(String variable) {
    _variable = variable;
  }

  @override
  VariableValue build() {
    return VariableValue(variable: variable);
  }

  @override
  Builder clone() {
    return VariableValueBuilder(variable: variable);
  }
}
