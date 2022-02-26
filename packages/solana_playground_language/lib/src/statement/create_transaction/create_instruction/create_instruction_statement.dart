import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_account_meta/create_account_meta_statement.dart';

import '../../../value/value.dart';
import '../create_instruction_data/create_instruction_data_statement.dart';

class CreateInstructionStatement extends BaseStatement {
  final BaseValue programId;
  final List<CreateAccountMetaStatement> accountMetas;
  final CreateInstructionDataStatement data;

  const CreateInstructionStatement({
    required this.programId,
    required this.accountMetas,
    required this.data,
  });

  @override
  List<Object> get props => [programId, accountMetas, data];
}
