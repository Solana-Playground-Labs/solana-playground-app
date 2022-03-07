import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'create_transaction_command_builder_state.dart';

class CreateTransactionCommandBuilderCubit
    extends Cubit<CreateTransactionCommandBuilderState> {
  final CreateTransactionCommandBuilder builder;

  CreateTransactionCommandBuilderCubit(this.builder)
      : super(CreateTransactionCommandBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

