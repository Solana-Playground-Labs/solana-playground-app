/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

class CreateTransactionCommandBuilder extends CommandBuilder {
  String _variable;
  ExpressionBuilder signers;
  ExpressionBuilder instructions;
  ExpressionBuilder feePayer;
  ExpressionBuilder recentBlockhash;

  CreateTransactionCommandBuilder({
    required String variable,
    required this.signers,
    required this.instructions,
    required this.feePayer,
    required this.recentBlockhash,
  }) : _variable = variable;

  factory CreateTransactionCommandBuilder.empty() {
    return CreateTransactionCommandBuilder(
      variable: "",
      signers: ExpressionBuilder(valueBuilder: JsonValueBuilder(data: [])),
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
      signers: signers.build(),
      instructions: instructions.build(),
      feePayer: feePayer.build(),
      recentBlockhash: recentBlockhash.build(),
    );
  }

  @override
  CommandBuilder clone() {
    return CreateTransactionCommandBuilder(
        variable: _variable,
        signers: signers.clone(),
        instructions: instructions.clone(),
        feePayer: feePayer.clone(),
        recentBlockhash: recentBlockhash.clone());
  }
}
