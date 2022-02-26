import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_account_meta/create_account_meta_statement.dart';

class CreateAccountMetaBuilder extends StatementBuilder {
  final ValueContainerBuilder pubkey;
  final ValueContainerBuilder isSigner;
  final ValueContainerBuilder isWritable;

  CreateAccountMetaBuilder({
    required this.pubkey,
    required this.isSigner,
    required this.isWritable,
  });

  @override
  StatementBuilder copy() {
    return CreateAccountMetaBuilder(pubkey: pubkey, isSigner: isSigner, isWritable: isWritable);
  }

  @override
  CreateAccountMetaStatement get statement => CreateAccountMetaStatement(
        pubkey: pubkey.valueBuilder.value,
        isSigner: isSigner.valueBuilder.value,
        isWritable: isWritable.valueBuilder.value,
      );
}
