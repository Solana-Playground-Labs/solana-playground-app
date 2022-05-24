/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'bool_meta_value_state.dart';

class BoolMetaValueCubit extends Cubit<BoolMetaValueState> {
  final BoolMetaValueBuilder meta;

  BoolMetaValueCubit(this.meta)
      : super(BoolMetaValueState(value: meta.builder.data)) {
    meta.builder.addListener(listener);
  }

  void listener() {
    if (state.value != meta.builder.data) {
      emit(state.copyWith(value: meta.builder.data));
    }
  }

  void toggle() {
    meta.builder.data = !meta.builder.data;
  }

  @override
  Future<void> close() async {
    meta.builder.removeListener(listener);
    return super.close();
  }
}
