import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_account_meta/create_account_meta_statement.dart';

class CreateMultipleAccountMetaStatement extends BaseStatement {
  final List<CreateAccountMetaStatement> accounts;

  const CreateMultipleAccountMetaStatement({required this.accounts});

  @override
  List<Object> get props => [accounts];
}