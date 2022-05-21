/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'list_value_builder_state.dart';

class ListValueBuilderCubit extends Cubit<ListValueBuilderState> {
  final ListBuilder<ExpressionBuilder> builder;

  ListValueBuilderCubit(this.builder)
      : super(ListValueBuilderState(expressions: List.of(builder))) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(expressions: List.of(builder)));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
