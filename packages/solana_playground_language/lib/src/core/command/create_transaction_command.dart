import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/expression/abstract_expression.dart';

import 'abstract_command.dart';

class CreateTransactionCommand extends Command {
  /// Should be {publicKey: string, signature: String}
  final Expression signatures;

  /// Should be
  /// [
  ///   {
  ///     programId: String
  ///     keys: { isSigner: boolean; isWritable: boolean; pubkey: PublicKey }
  ///     data: String
  ///   }
  /// ]
  final Expression instructions;

  /// String
  final Expression feePayer;

  /// String
  final Expression recentBlockhash;

  const CreateTransactionCommand({
    required this.signatures,
    required this.instructions,
    required this.feePayer,
    required this.recentBlockhash,
  });

  @override
  List<Object> get props => [
        signatures,
        instructions,
        feePayer,
        recentBlockhash,
      ];
}
