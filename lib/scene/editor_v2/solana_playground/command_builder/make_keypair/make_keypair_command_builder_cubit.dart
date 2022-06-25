/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'make_keypair_command_builder_state.dart';

class MakeKeypairCommandBuilderCubit extends Cubit<MakeKeypairCommandBuilderState> {
  final MakeKeyPairCommandBuilder builder;
  final variableInput = TextEditingController();

  MakeKeypairCommandBuilderCubit(this.builder) : super(const MakeKeypairCommandBuilderState()) {
    builder.addListener(listener);

    variableInput.text = builder.variable;
    variableInput.addListener(() {
      builder.variable = variableInput.text;
    });
  }

  void listener() {
    if (variableInput.text != builder.variable) {
      variableInput.text = builder.variable;
    }
  }

  @override
  Future<void> close() async {
    variableInput.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
