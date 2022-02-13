import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_signature_pubkey_pair/create_signature_pubkey_pair_statement.dart';

class CreateSignaturePubkeyBuilder extends StatementBuilder {
  ValueContainerBuilder pubkey;
  ValueContainerBuilder signature;

  CreateSignaturePubkeyBuilder({
    required this.pubkey,
    required this.signature,
  });

  factory CreateSignaturePubkeyBuilder.standard() {
    return CreateSignaturePubkeyBuilder(
      pubkey: ValueContainerBuilder.standard(),
      signature: ValueContainerBuilder.standard(),
    );
  }

  @override
  StatementBuilder copy() {
    return CreateSignaturePubkeyBuilder(pubkey: pubkey, signature: signature);
  }

  @override
  CreateSignaturePubkeyPairStatement get statement => CreateSignaturePubkeyPairStatement(
    publicKey: pubkey.valueBuilder.value,
    signature: pubkey.valueBuilder.value,
  );
}
