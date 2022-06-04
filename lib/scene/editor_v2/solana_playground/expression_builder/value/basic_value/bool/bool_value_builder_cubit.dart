/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'bool_value_builder_state.dart';

class BoolValueBuilderCubit extends Cubit<BoolValueBuilderState> {
  final BoolValueBuilder builder;

  BoolValueBuilderCubit(this.builder)
      : super(
          BoolValueBuilderState(value: builder.value),
        ) {
    builder.addListener(listener);
  }

  void listener() {
    if (state.value != builder.value) {
      emit(state.copyWith(value: builder.value));
    }
  }

  void toggle() {
    builder.value = !builder.value;
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
