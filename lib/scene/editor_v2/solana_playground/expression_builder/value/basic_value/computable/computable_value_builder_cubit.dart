/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'computable_value_builder_state.dart';

class ComputableValueBuilderCubit extends Cubit<ComputableValueBuilderState> {
  final ComputableValueBuilder builder;
  final TextEditingController inputController = TextEditingController();

  ComputableValueBuilderCubit(this.builder)
      : super(ComputableValueBuilderState(value: builder.value.toString())) {
    builder.addListener(listener);

    inputController.text = builder.value.toString();
    inputController.addListener(() {
      builder.value = inputController.text;
    });
  }

  void listener() {
    if (builder.value.toString() != inputController.text) {
      inputController.text = builder.value.toString();
    }
    emit(state.copyWith(value: builder.value.toString()));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    inputController.dispose();
    return super.close();
  }
}
