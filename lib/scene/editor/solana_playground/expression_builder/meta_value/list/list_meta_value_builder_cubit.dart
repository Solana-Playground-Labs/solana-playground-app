/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'list_meta_value_builder_state.dart';

class ListMetaValueBuilderCubit extends Cubit<ListMetaValueBuilderState> {
  final ListMetaValueBuilder builder;

  ListMetaValueBuilderCubit(this.builder)
      : super(ListMetaValueBuilderState(builders: List.of(builder.data))) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(builders: List.of(builder.data)));
  }

  void moveUp(dynamic object) {
    final index = state.builders.indexOf(object);
    if (index >= 0) builder.moveTo(object, index + 1);
  }

  void moveDown(dynamic object) {
    final index = state.builders.indexOf(object);
    if (index >= 0) builder.moveTo(object, index - 1);
  }

  void remove(object) {
    builder.remove(object);
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }

}
