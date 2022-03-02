import 'package:solana_playground_language/src/builder/builder.dart';
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
