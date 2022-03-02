import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/declare_variable_command.dart';

class DeclareVariableCommandBuilder extends CommandBuilder {
  final String variable;
  final ExpressionBuilder expressionBuilder;

  DeclareVariableCommandBuilder({
    required this.variable,
    required this.expressionBuilder,
  });

  factory DeclareVariableCommandBuilder.empty() {
    return DeclareVariableCommandBuilder(
      variable: "",
      expressionBuilder: ExpressionBuilder.withConstantValue(),
    );
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
