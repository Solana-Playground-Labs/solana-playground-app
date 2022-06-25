/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'instruction_value_builder_state.dart';

class InstructionValueBuilderCubit extends Cubit<InstructionValueBuilderState> {
  final InstructionValueBuilder builder;

  InstructionValueBuilderCubit(this.builder) : super(InstructionValueBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
