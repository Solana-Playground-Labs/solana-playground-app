import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/create_transaction_command.dart';

class CreateTransactionCommandBuilder extends CommandBuilder {
  String _variable;
  ExpressionBuilder signatures;
  ExpressionBuilder instructions;
  ExpressionBuilder feePayer;
  ExpressionBuilder recentBlockhash;

  CreateTransactionCommandBuilder({
    required String variable,
    required this.signatures,
    required this.instructions,
    required this.feePayer,
    required this.recentBlockhash,
  }) : _variable = variable;

  factory CreateTransactionCommandBuilder.empty() {
    return CreateTransactionCommandBuilder(
      variable: "",
      signatures: ExpressionBuilder(valueBuilder: JsonValueBuilder(data: [])),
      instructions: ExpressionBuilder(valueBuilder: JsonValueBuilder(data: [])),
      feePayer: ExpressionBuilder.withConstantValue(),
      recentBlockhash: ExpressionBuilder.withVariable(),
    );
  }

  String get variable => _variable;

  set variable(String value) {
    _variable = value;
    notifyListeners();
  }

  @override
  CreateTransactionCommand build() {
    return CreateTransactionCommand(
      variable: variable,
      signatures: signatures.build(),
      instructions: instructions.build(),
      feePayer: feePayer.build(),
      recentBlockhash: recentBlockhash.build(),
    );
  }

  @override
  CommandBuilder clone() {
    return CreateTransactionCommandBuilder(
        variable: _variable,
        signatures: signatures.clone(),
        instructions: instructions.clone(),
        feePayer: feePayer.clone(),
        recentBlockhash: recentBlockhash.clone());
  }
}
