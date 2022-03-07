import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'transaction_instruction_meta_value_builder_state.dart';

class TransactionInstructionMetaValueBuilderCubit
    extends Cubit<TransactionInstructionMetaValueBuilderState> {
  final JsonValueBuilder builder;

  TransactionInstructionMetaValueBuilderCubit(this.builder)
      : super(TransactionInstructionMetaValueBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

