import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/create_transaction_command.dart';

class CreateTransactionCommandBuilder extends CommandBuilder {
  ExpressionBuilder signatures;

  ExpressionBuilder instructions;

  ExpressionBuilder feePayer;

  ExpressionBuilder recentBlockhash;

  CreateTransactionCommandBuilder({
    required this.signatures,
    required this.instructions,
    required this.feePayer,
    required this.recentBlockhash,
  });

  factory CreateTransactionCommandBuilder.empty() {
    return CreateTransactionCommandBuilder(
      signatures: ExpressionBuilder(valueBuilder: JsonValueBuilder(data: [])),
      instructions: ExpressionBuilder(valueBuilder: JsonValueBuilder(data: [])),
      feePayer: ExpressionBuilder.withConstantValue(),
      recentBlockhash: ExpressionBuilder.withVariable(),
    );
  }

  @override
  CreateTransactionCommand build() {
    return CreateTransactionCommand(
      signatures: signatures.build(),
      instructions: instructions.build(),
      feePayer: feePayer.build(),
      recentBlockhash: recentBlockhash.build(),
    );
  }

  @override
  CommandBuilder clone() {
    return CreateTransactionCommandBuilder(
        signatures: signatures.clone(),
        instructions: instructions.clone(),
        feePayer: feePayer.clone(),
        recentBlockhash: recentBlockhash.clone());
  }
}
