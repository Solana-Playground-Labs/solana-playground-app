/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/expression/variable_value.dart';

class VariableValueBuilder extends ValueBuilder {
  String _variable;

  VariableValueBuilder({required String variable}) : _variable = variable;

  String get variable => _variable;

  set variable(String variable) {
    _variable = variable;
    notifyListeners();
  }

  @override
  String get name => "Var";

  @override
  VariableValue build() {
    return VariableValue(variable: variable);
  }

  @override
  VariableValueBuilder clone() {
    return VariableValueBuilder(variable: variable);
  }
}
