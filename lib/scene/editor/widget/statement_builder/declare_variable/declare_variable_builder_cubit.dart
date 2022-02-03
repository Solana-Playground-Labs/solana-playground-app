import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'declare_variable_builder_state.dart';

class DeclareVariableBuilderCubit extends Cubit<DeclareVariableBuilderState> {
  final DeclareVariableBuilder builder;
  final nameTextController = TextEditingController();
  final valueTextController = TextEditingController();

  DeclareVariableBuilderCubit(this.builder) : super(DeclareVariableBuilderState(statement: builder.statement)) {
    builder.addListener(listener);
  }

  listener() {
    final name = builder.statement.name;
    if (name != nameTextController.text) {
      nameTextController.text = name;
    }

    final value = builder.statement.value;
    if (value is ConstantValue) {
      if (value.constant != nameTextController.text) {
        valueTextController.text = value.constant;
      }
    }
  }

  @override
  Future close() async {
    builder.removeListener(listener);
    super.close();
  }
}
