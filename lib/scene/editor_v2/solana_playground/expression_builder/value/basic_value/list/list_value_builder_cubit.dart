/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'list_value_builder_state.dart';

class ListValueBuilderCubit extends Cubit<ListValueBuilderState> {
  final ListValueBuilder builder;

  ListValueBuilderCubit(this.builder)
      : super(ListValueBuilderState(expressions: List.of(builder))) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(expressions: List.of(builder)));
  }

  void moveUp(dynamic object) {
    if (object is ValueBuilder) {
      final index = builder.expressions.indexWhere((element) => element.valueBuilder == object);
      final expression = builder.expressions[index];
      if (index >= 0) builder.moveTo(expression, index - 1);
    } else {
      final index = state.expressions.indexOf(object);
      if (index >= 0) builder.moveTo(object, index - 1);
    }
  }

  void moveDown(dynamic object) {
    if (object is ValueBuilder) {
      final index = builder.expressions.indexWhere((element) => element.valueBuilder == object);
      final expression = builder.expressions[index];
      if (index >= 0) builder.moveTo(expression, index + 1);
    } else {
      final index = state.expressions.indexOf(object);
      if (index >= 0) builder.moveTo(object, index + 1);
    }
  }

  void remove(object) {
    if (object is ValueBuilder) {
      final expression =
          builder.expressions.firstWhere((element) => element.valueBuilder == object);
      builder.remove(expression);
    } else {
      builder.remove(object);
    }
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
