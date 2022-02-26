import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_instruction/create_instruction_builder.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_signature_pubkey_pair/create_signature_pubkey_pair_builder.dart';

class CreateTransactionBuilder extends StatementBuilder {
  final ListBaseBuilder<CreateSignaturePubkeyBuilder> signatures;
  final ListBaseBuilder<CreateInstructionBuilder> instructions;
  final ValueContainerBuilder feePayer;
  final ValueContainerBuilder recentBlockhash;

  CreateTransactionBuilder({
    required this.signatures,
    required this.instructions,
    required this.feePayer,
    required this.recentBlockhash,
  });

  @override
  StatementBuilder copy() {
    return CreateTransactionBuilder(
      signatures: signatures,
      instructions: instructions,
      feePayer: feePayer,
      recentBlockhash: recentBlockhash,
    );
  }

  @override
  CreateTransactionStatement get statement => CreateTransactionStatement(
        instructions: instructions.builders.map((e) => e.statement).toList(),
        feePayer: feePayer.valueBuilder.value,
        recentBlockhash: recentBlockhash.valueBuilder.value,
        signatures: signatures.builders.map((e) => e.statement).toList(),
      );
}
