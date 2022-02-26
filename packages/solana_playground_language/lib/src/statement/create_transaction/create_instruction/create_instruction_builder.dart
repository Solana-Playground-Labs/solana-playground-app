import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_account_meta/create_account_meta_builder.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_instruction/create_instruction_statement.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_instruction_data/create_instruction_data_builder.dart';

class CreateInstructionBuilder extends StatementBuilder {
  final ValueContainerBuilder programId;
  final ListBaseBuilder<CreateAccountMetaBuilder> accountMetas;
  final CreateInstructionDataBuilder data;

  CreateInstructionBuilder({
    required this.programId,
    required this.accountMetas,
    required this.data,
  });

  @override
  CreateInstructionBuilder copy() {
    return CreateInstructionBuilder(programId: programId, accountMetas: accountMetas, data: data);
  }

  @override
  CreateInstructionStatement get statement => CreateInstructionStatement(
        programId: programId.valueBuilder.value,
        accountMetas: accountMetas.builders.map((e) => e.statement).toList(),
        data: data.statement,
      );
}
