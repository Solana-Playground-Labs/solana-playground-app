/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

class DeclareVariableCommandBuilder extends CommandBuilder {
  String _variable;
  ExpressionBuilder _expressionBuilder;

  DeclareVariableCommandBuilder({
    required String variable,
    required ExpressionBuilder expressionBuilder,
  })  : _variable = variable,
        _expressionBuilder = expressionBuilder;

  factory DeclareVariableCommandBuilder.empty() {
    return DeclareVariableCommandBuilder(
      variable: "",
      expressionBuilder: ExpressionBuilder.withStringValue(),
    );
  }

  ExpressionBuilder get expressionBuilder => _expressionBuilder;

  set expressionBuilder(ExpressionBuilder expressionBuilder) {
    _expressionBuilder = expressionBuilder;
    notifyListeners();
  }

  String get variable => _variable;

  set variable(String variable) {
    _variable = variable;
    notifyListeners();
  }

  @override
  DeclareVariableCommand build() {
    return DeclareVariableCommand(
      variable: variable,
      expression: expressionBuilder.build(),
    );
  }

  @override
  CommandBuilder clone() {
    return DeclareVariableCommandBuilder(
      variable: variable,
      expressionBuilder: expressionBuilder.clone(),
    );
  }
}
