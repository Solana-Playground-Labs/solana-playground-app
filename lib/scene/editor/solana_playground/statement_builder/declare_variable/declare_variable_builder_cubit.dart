import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'declare_variable_builder_state.dart';

class DeclareVariableBuilderCubit extends Cubit<DeclareVariableBuilderState> {
  final DeclareVariableBuilder builder;
  final nameTextController = TextEditingController();

  DeclareVariableBuilderCubit(this.builder) : super(DeclareVariableBuilderState(internalType: builder.internalType)) {
    builder.addListener(listener);

    nameTextController.text = builder.name;
    nameTextController.addListener(() {
      builder.name = nameTextController.text;
    });
  }

  listener() {
    final name = builder.statement.name;
    if (name != nameTextController.text) {
      nameTextController.text = name;
    }

    emit(state.copyWith(internalType: builder.internalType));
  }

  @override
  Future close() async {
    builder.removeListener(listener);
    super.close();
  }
}
