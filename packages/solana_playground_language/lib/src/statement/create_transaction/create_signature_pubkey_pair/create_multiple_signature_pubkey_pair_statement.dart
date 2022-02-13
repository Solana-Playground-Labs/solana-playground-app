import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_signature_pubkey_pair/create_signature_pubkey_pair_statement.dart';

class CreateMultipleSignaturePubkeyPairStatement extends BaseStatement {
  final List<CreateSignaturePubkeyPairStatement> signatures;

  const CreateMultipleSignaturePubkeyPairStatement({required this.signatures});

  @override
  List<Object> get props => [signatures];
}
