/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'import_wallet_command_builder_state.dart';

class ImportWalletCommandBuilderCubit
    extends Cubit<ImportWalletCommandBuilderState> {
  final ImportWalletCommandBuilder builder;
  final variableInput = TextEditingController();

  ImportWalletCommandBuilderCubit(this.builder)
      : super(const ImportWalletCommandBuilderState()) {
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
