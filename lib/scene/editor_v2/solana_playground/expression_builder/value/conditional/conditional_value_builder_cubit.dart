/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'conditional_value_builder_state.dart';

class ConditionalValueBuilderCubit extends Cubit<ConditionalValueBuilderState> {
  final ConditionalValueBuilder builder;

  ConditionalValueBuilderCubit(this.builder)
      : super(ConditionalValueBuilderState(
          comparisonOperator: builder.comparisonOperator,
        )) {
    builder.addListener(listener);
  }

  void listener() {
    if (state.comparisonOperator != builder.comparisonOperator) {
      emit(state.copyWith(comparisonOperator: builder.comparisonOperator));
    }
  }

  void setOperator(ComparisonOperator operator) {
    builder.comparisonOperator = operator;
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
