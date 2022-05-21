/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'declare_variable_command_builder_state.dart';

class DeclareVariableCommandBuilderCubit
    extends Cubit<DeclareVariableCommandBuilderState> {
  final DeclareVariableCommandBuilder builder;
  final variableInputController = TextEditingController();

  DeclareVariableCommandBuilderCubit(this.builder)
      : super(const DeclareVariableCommandBuilderState()) {
    builder.addListener(listener);

    variableInputController.text = builder.variable;
    variableInputController.addListener(() {
      builder.variable = variableInputController.text;
    });
  }

  void listener() {
    if (builder.variable != variableInputController.text) {
      variableInputController.text = builder.variable;
    }
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
