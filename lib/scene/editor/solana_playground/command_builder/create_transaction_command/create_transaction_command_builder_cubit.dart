import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'create_transaction_command_builder_state.dart';

class CreateTransactionCommandBuilderCubit
    extends Cubit<CreateTransactionCommandBuilderState> {
  final CreateTransactionCommandBuilder builder;
  final variableInput = TextEditingController();

  CreateTransactionCommandBuilderCubit(this.builder)
      : super(const CreateTransactionCommandBuilderState()) {
    builder.addListener(listener);

    variableInput.text = builder.variable;
    variableInput.addListener(() {
      builder.variable = variableInput.text;
    });
  }

  void listener() {
    if (variableInput.text != builder.variable) {
      variableInput.text = builder.variable;
    }
  }

  @override
  Future<void> close() async {
    variableInput.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
