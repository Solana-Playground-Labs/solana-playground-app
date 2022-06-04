/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'make_simple_transaction_state.dart';

class MakeSimpleTransactionCubit extends Cubit<MakeSimpleTransactionState> {
  final variable = TextEditingController();
  final MakeSimpleTransactionBuilder builder;

  MakeSimpleTransactionCubit(this.builder)
      : super(const MakeSimpleTransactionState()) {

    variable.text = builder.variable;
    variable.addListener(() {
      builder.variable = variable.text;
    });

    builder.addListener(listener);
  }

  void listener() {
    if (variable.text != builder.variable) {
      variable.text = builder.variable;
    }
  }

  @override
  Future<void> close() async {
    variable.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}

