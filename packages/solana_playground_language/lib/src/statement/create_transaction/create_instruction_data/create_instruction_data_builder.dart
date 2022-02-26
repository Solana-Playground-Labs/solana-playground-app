import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/create_transaction/create_instruction_data/create_instruction_data_statement.dart';

class CreateInstructionDataBuilder extends StatementBuilder {
  @override
  StatementBuilder copy() {
    return CreateInstructionDataBuilder();
  }

  @override
  CreateInstructionDataStatement get statement => CreateInstructionDataStatement();

}