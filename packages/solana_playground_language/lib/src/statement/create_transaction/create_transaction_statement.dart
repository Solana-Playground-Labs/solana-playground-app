import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_instruction/create_instruction_statement.dart';

import 'create_signature_pubkey_pair/create_signature_pubkey_pair_statement.dart';

class CreateTransactionStatement extends BaseStatement {
  final List<CreateInstructionStatement> instructions;
  final BaseValue feePayer;
  final BaseValue recentBlockhash;
  final List<CreateSignaturePubkeyPairStatement> signatures;

  @override
  InternalType get returnType => const InternalObject(TransactionSchema());

  const CreateTransactionStatement({
    required this.instructions,
    required this.feePayer,
    required this.recentBlockhash,
    required this.signatures,
  });

  @override
  List<Object> get props => [
        instructions,
        feePayer,
        recentBlockhash,
        signatures,
      ];
}
