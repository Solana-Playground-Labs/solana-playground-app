/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'get_recent_block_hash_command_builder_state.dart';

class GetRecentBlockHashCommandBuilderCubit extends Cubit<GetRecentBlockHashCommandBuilderState> {
  final GetRecentBlockHashCommandBuilder builder;
  final variableInput = TextEditingController();

  GetRecentBlockHashCommandBuilderCubit(this.builder)
      : super(const GetRecentBlockHashCommandBuilderState()) {
    builder.addListener(listener);

    variableInput.text = builder.variable;
    variableInput.addListener(() {
      builder.variable = variableInput.text;
    });
  }

  void listener() {
    if (variableInput.text != variableInput.text) {
      variableInput.text = variableInput.text;
    }
  }

  @override
  Future<void> close() async {
    variableInput.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
