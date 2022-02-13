import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_signature_pubkey_pair/create_multiple_signature_pubkey_pair_statement.dart';

import 'create_signature_pubkey_pair_builder.dart';

class CreateMultipleSignaturePubkeyBuilder extends StatementBuilder {
  List<CreateSignaturePubkeyBuilder> signatures;

  CreateMultipleSignaturePubkeyBuilder({required this.signatures});

  factory CreateMultipleSignaturePubkeyBuilder.standard() {
    return CreateMultipleSignaturePubkeyBuilder(signatures: [CreateSignaturePubkeyBuilder.standard()]);
  }

  @override
  StatementBuilder copy() => CreateMultipleSignaturePubkeyBuilder(signatures: signatures);

  @override
  BaseStatement get statement => CreateMultipleSignaturePubkeyPairStatement(
        signatures: signatures.map((e) => e.statement).toList(),
      );
}
