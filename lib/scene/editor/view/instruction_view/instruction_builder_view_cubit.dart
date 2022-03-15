/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'instruction_builder_view_state.dart';

class InstructionBuilderViewCubit extends Cubit<InstructionBuilderViewState> {
  final JsonValueBuilder builder;

  InstructionBuilderViewCubit(this.builder)
      : super(InstructionBuilderViewState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

