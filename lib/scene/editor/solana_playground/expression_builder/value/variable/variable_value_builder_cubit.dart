/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'variable_value_builder_state.dart';

class VariableValueBuilderCubit extends Cubit<VariableValueBuilderState> {
  final VariableValueBuilder builder;
  final inputController = TextEditingController();

  VariableValueBuilderCubit(this.builder)
      : super(VariableValueBuilderState(variable: builder.variable)) {
    builder.addListener(listener);

    inputController.text = builder.variable;
    inputController.addListener(() {
      builder.variable = inputController.text;
    });
  }

  void listener() {
    if (builder.variable != inputController.text) {
      inputController.text = builder.variable;
    }
    emit(state.copyWith(variable: builder.variable));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
