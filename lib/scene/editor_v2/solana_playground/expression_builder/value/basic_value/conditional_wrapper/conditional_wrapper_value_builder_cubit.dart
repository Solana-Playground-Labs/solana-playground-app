/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'conditional_wrapper_value_builder_state.dart';

class ConditionalWrapperValueBuilderCubit extends Cubit<ConditionalWrapperValueBuilderState> {
  final ConditionalWrapperValueBuilder builder;

  ConditionalWrapperValueBuilderCubit(this.builder) : super(ConditionalWrapperValueBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
